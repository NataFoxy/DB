3.1 выведите название видеороликов и имена их авторов

select videos.title,
       users.username
from videos

join users on videos.author_id = users.user_id
------------------------------------------------------------------------------

3.2 выведите имя автора самого короткого по продолжительности видеоролика

select 
	videos.duration_secs,
	users.username
from videos

join users on videos.author_id = users.user_id

order by duration_secs
limit 1

