Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010454;
	b=HibOd4W3vXMRynt+ljQ7Tla175KzIb0XohpYBDS9MO6wr5AyyZpYmKV6ohAc9DpvdOSp
	 5G+9A0U9oA3eVaTvqI1iwY2DS835wwsaLYt9ruCk+66O9WHATzkqQDnxldZYdZNCU6dtT
	 zoXZKsG5pcko8SewO9k55j6tKGdkkDkYXnxcJK2HMjtnb7RFdrZz5coONCqluQXsHv+X/
	 t0tymKIhzLjpBfG7MFMyE5dA4NDyu7VROybUNdXALcN60d/Ls/M914MB48RbjHBOXa7Eg
	 6g0VQXld/Xv/0XdPdvr7bZFL6iA7hxe20elvxNTgUFXJYI/L8/ryzSaCYIcuTIbtf6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010454;
	h=DMARC-Filter:DKIM-Signature:Date:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=2Q790Rwm3zEB8bDBmjgQlFRAomWrIxaHrGw4h5UPzvU=;
	b=o+ca6nJn7QXkjLbcA9qmhqFwMixCfz5OXvLEE7J9D4LCqHGEMLpqhl3IX57Qm5mpY0XA
	 JV0V8gV6UMIXSQJZypa8AI4zxUFiYC1uVyj+pkHdDkjlNGgoYqVH7xpsb+MZOajgi/fNt
	 unFmn71NqmHP+NTxNKnBiplDotLEEFHZQGqvp7rBkdu0LHIuZW+oHJa3atlQu4YtUnt4Y
	 sFFNuOA4otN6k4+H/iCPJt7ObszDO9NKZjZ9VXVcHxCYXLWHMh7nW3WETV/z7QLIBxDBX
	 GZcmuHqeTx+hLabSw3EXiASlol+MMrc6kRT9TLQSQKtzZEJkJ6seGnzbY1kVaIe4xkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jaeyeong.cc;
	spf=pass smtp.mailfrom=jaeyeong.cc;
	dkim=pass header.d=jaeyeong.cc header.i=@jaeyeong.cc header.a=rsa-sha256 header.s=protonmail2 header.b=aiX0cLK0;
	arc=none smtp.remote-ip=185.70.43.17
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5E5606A320;
	Wed, 18 Nov 2026 14:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA5E5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaeyeong.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaeyeong.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jaeyeong.cc header.i=@jaeyeong.cc header.a=rsa-sha256 header.s=protonmail2 header.b=aiX0cLK0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaeyeong.cc;
	s=protonmail2; t=1795010451; x=1795269651;
	bh=2Q790Rwm3zEB8bDBmjgQlFRAomWrIxaHrGw4h5UPzvU=;
	h=Date:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=aiX0cLK0afv2l5UdwSjXj7pNP34WhTNgpMQV+ySN43hSztOeYXzjHIQ4ITZ/ovOiA
	 fIkUZY2h56FMF+Fzn0C3Hr255WI3igIlm3L0QlSixA1ARNcD+ROKj+g7dPw/R5CAUT
	 dvQMPIWv3PMReb0lLff/6CXqsMN5eKSN3XikE052i5uDbwmmnki4sojOUFOs2Q3LS1
	 URuI3kzCaFj1AxbqH3LiVsXr80kc0c0XOHUydxoYdp2euQPdLoNzLsakBwQM3sXMcW
	 d+StFVc/gO6L1tCUDWeMWmvyPHe/mzvkBndZ0D52jVCN7QhlZXC419QZCSS4nmKDW6
	 Zgk0P6mgt2eBQ==
Date: Wed, 18 Nov 2026 14:00:45 +0000
From: Jaeyeong Lee <lee@jaeyeong.cc>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH] wifi: cfg80211: initialize BSS nodes after failed rehash
Message-ID: <20261118135524.301519-1-lee@jaeyeong.cc>
Feedback-ID: 177356447:user:proton
X-Pm-Message-ID: ab521237427ee993902df0a64ae3f51ca62e97c6
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

cfg80211_rehash_bss() removes the BSS from the rbtree before trying to
insert it under its new key. If insertion fails because another BSS has
the same key, the function removes the BSS from bss_list with
list_del().

The list node is then poisoned rather than initialized. As a result,
cfg80211_unlink_bss() does not recognize the BSS as already unpublished
and calls __cfg80211_unlink_bss(), which deletes the poisoned list node
and the already removed rbtree node again. This can corrupt both
containers and crash the kernel.

Clear the rbtree node immediately after erasing it, and use
list_del_init() on the failure path, so later unlink attempts recognize
that the BSS is no longer published.

Fixes: 7f12e26a194d ("wifi: cfg80211: make hash table duplicates more survi=
vable")
Cc: stable@vger.kernel.org
Signed-off-by: Jaeyeong Lee <lee@jaeyeong.cc>
---
 net/wireless/scan.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/wireless/scan.c b/net/wireless/scan.c
index 1c50a16c0e9be..c285c60f5b6d8 100644
--- a/net/wireless/scan.c
+++ b/net/wireless/scan.c
@@ -1785,8 +1785,9 @@ static void cfg80211_rehash_bss(struct cfg80211_regis=
tered_device *rdev,
 =09lockdep_assert_held(&rdev->bss_lock);
=20
 =09rb_erase(&bss->rbn, &rdev->bss_tree);
+=09RB_CLEAR_NODE(&bss->rbn);
 =09if (!rb_insert_bss(rdev, bss)) {
-=09=09list_del(&bss->list);
+=09=09list_del_init(&bss->list);
 =09=09if (!list_empty(&bss->hidden_list))
 =09=09=09list_del_init(&bss->hidden_list);
 =09=09if (!list_empty(&bss->pub.nontrans_list))
--=20
2.43.0



