from typing import Dict, Iterable, Iterator
import xml.etree.ElementTree as ETree
import psycopg2
import re

post_attrs = [
    'Id',
    'Title',
    'Body',
    'CommentCount',
    'CreationDate',
    'LastActivityDate',
    'OwnerUserId',
    'Score',
    'ViewCount',
    'AnswerCount',
    'Tags',
    'PostTypeId',
    'ParentId'
]

user_attrs = [
    'Id',
    'Reputation',
    'UpVotes',
    'DownVotes',
    'LastAccessDate',
    'Views'
]

links_attrs = [
    'Id',
    'CreationDate',
    'LinkTypeId',
    'PostId',
    'RelatedPostId',
]

t = {
    "Users": user_attrs,
    "Posts": post_attrs,
    "Links": links_attrs
}

def convert(name):
    s1 = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
    return re.sub('([a-z0-9])([A-Z])', r'\1_\2', s1).lower()

def xml_to_df( xml: Iterator, attrs) -> ():
    for event, row in xml:
        # row = xml[i]
        instance = {}

        for a in attrs:
            instance[a] = None
            if a in row.attrib:
                instance[a] = row.attrib[a]
        # if is_question(instance):
        yield instance

def retrieve( path: str) -> Iterator:
    return ETree.iterparse(path + ".xml")
# try:
#     conn = psycopg2.connect("dbname='qa' user='postgres' host='localhost' password='admin'")
#     conn.autocommit = True
# except:
#     print("Connection failed")
#     exit(1)
# cur = conn.cursor()

data_path = "/home/daniel/ufba/rec/datasets/stackoverflow/ubuntu"
conn = psycopg2.connect("dbname='qa' user='postgres' host='localhost' password='admin'")
conn.autocommit = True
for key, attrs in t.items():
    content = retrieve(data_path + "/" + key)
    posts = xml_to_df(content, attrs)
    for post in posts:
        if post['Id']:
            p = ""
            for a in attrs:
                p = p + "%s,"
            p = p[:-1]

            i = ""
            for a in attrs:
                i = i + convert(a) + ","
            i = i[:-1]
            q = "INSERT INTO " + key + "(" + i + ") VALUES (" + p + ")"
            v = []
            for i in attrs:
                v.append(post[i])

            with conn.cursor() as cur:
                try:
                    cur.execute(q, v)
                except psycopg2.IntegrityError as err:
                    print(str(v) + " could not be inserted")
                    print(err)