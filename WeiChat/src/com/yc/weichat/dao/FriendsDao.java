package com.yc.weichat.dao;

import java.util.List;
import java.util.Map;

public interface FriendsDao {
	public List<Map<String, Object>> selectFriends(String myselfId);
	public int updateFriend(String myselfId,String friendId,String friendName);
}
