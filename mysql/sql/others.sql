LOAD XML INFILE
'/home/daniel/ufba/rec/datasets/stackoverflow/freelancing/Users.xml'
into table qa.users ( Id,
  Reputation,
  UpVotes,
  DownVotes,
  @LastAccessDate,
  Views,
  @CreationDate)
 SET last_access_date = @LastAccessDate,
  creation_date = @CreationDate;

LOAD XML INFILE
'/home/daniel/ufba/rec/datasets/stackoverflow/freelancing/Links.xml'
into table qa.links ( Id,
  @PostId,
  @RelatedPostId,
  @LinkTypeId,
  @CreationDate)
 SET post_id = @PostId,
type = @LinkTypeId,
 related_post_id = @RelatedPostId,
  creation_date = @CreationDate