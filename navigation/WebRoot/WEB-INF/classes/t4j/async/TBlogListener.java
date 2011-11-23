/*
Copyright (c) 2007-2009, Yusuke Yamamoto
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Yusuke Yamamoto nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY Yusuke Yamamoto ``AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Yusuke Yamamoto BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
package t4j.async;

import java.util.List;

import t4j.TBlogException;
import t4j.data.Comment;
import t4j.data.DirectMessage;
import t4j.data.PagableResponseList;
import t4j.data.Status;
import t4j.data.User;
import t4j.data.Venue;

/**
 * 
 * @author gcwang
 *
 */
public interface TBlogListener {

	void onException(TBlogException te, int method);

	void gotHomeTimeline(List<Status> homeTimeline);

	void gotPublicTimeline(List<Status> publicTimeline);

	void gotMentions(List<Status> mentions);

	void gotUserTimeline(List<Status> userTimeline);

	void gotRetweetsOfMe(List<Status> retweetsOfMe);

	void updatedStatus(Status status);

	void retweeted(Status retweet);

	void shownStatus(Status showStatus);

	void destoryed(Status destroy);

	void shownUser(User showUser);

	void gotFriends(PagableResponseList<User> friends);

	void gotFollowers(PagableResponseList<User> followers);

	void createdFriendship(User createFriendship);

	void destroyedFriendship(User destroyFriendship);

	void gotDirectMessage(List<DirectMessage> directMessages);

	void sentDirectMessage(DirectMessage sendDirectMessage);

	void destroyedDirectMessage(DirectMessage destroyDirectMessage);

	void gotSentDirectMessages(List<DirectMessage> sentDirectMessages);

	void gotFavorites(List<Status> favorites);

	void createdFavorites(Status createFavorite);

	void destroyedFavorite(Status destroyFavorite);

	void verifiedCredentials(User verifyCredentials);

	void createdBlock(User createBlock);

	void destroyedBlock(User destroyBlock);

	void existsBlock(User existsBlock);

	void gotBlockUsers(List<User> blockUsers);

	void gotBlockUserIds(long[] blockUserIds);

	void updatedImage(String imageURL);

	void searchedStatus(List<Status> status);

	void searchedUsers(List<User> searchUser);

	void gotVenues(List<Venue> venues);

	void gotLocationTimeline(List<Status> locationTimeline);

	void gotComments(List<Comment> comments);
	
}
