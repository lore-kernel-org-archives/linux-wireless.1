Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485964;
	b=RaEZSUcS05H57GHmYA7K6se96y6zHn0DTJZZ+1AOGzRLeAXgpPex66KbVITTE18I8TCS
	 zEeChGnH0ej0okr8crlrE1pRRKqplP4tqOF5ajK+f3VBl5XGQf0RicbRmoav2TuHRFZUC
	 VtLO1D5/2Mw0pjC6DpmyertLUHLZLmaN0z0xUEWdpM3Vzik4zkOcj0SEpQTzwRgWzxQfv
	 riKRevwwD4tQUCWgFMBtqCd7ao9F5sApdxgY/JGdqNcItLfloqAzhBLyTj9Ptjjxtx5iG
	 shkWJuUlIQyKb50PGFJzPebz1lBqVR8UAK+A77igClx1UdiqaDygCVF7wGJCkOsVf9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=oNydO2SzkAYs5DK03LxQ5roF10I5Ez36bfBcDGkOKnM=;
	b=tWIRazbR4t3Tbmdh94FT/1U9KZqiPusNTql/ElQh7kUNgSV34Dyw04ml40Qbmajx+3BS
	 uJuDhmhSSyXZslDDP98ZpsqL0/rk/fbjfWLxBpwsNximpAaztMWdphYO5ESq/CL/shmpS
	 VXbIInkpIHle9zhJRemFM53RsTV1TkWARE07es+VUn8xHIQGjtv/pR0wkzaSHKxRufJnm
	 2xbM58YCVMmtkA/QPzL1jFCuHzaAGJ/vvtAlxnHWDhhKA3mluEPJOHp8umnGECyRKQ9q6
	 x1d3Och18wzLSiS6ybBZX7e3pAef0sgE9rV0efoMgZQgk5cTbM9vgRwV1CAElFb3vQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=TRpzuK1K;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04A8606A321
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 02:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E04A8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=TRpzuK1K
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15ea896ddc8so6696926c88.0
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 18:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1795485963; x=1796090763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oNydO2SzkAYs5DK03LxQ5roF10I5Ez36bfBcDGkOKnM=;
        b=TRpzuK1KGHFTa7IuuH6VGVWcrYyDMV5xnup5+ktyk2OPGk6ey7bAIEVyru10LE5LDE
         NiDRegbvx6TKTOFSr1UFHLfl4MepVpYGqNp+DvEXcyINCG1mo2Li2fi9kBH2UCb3sCq3
         sq13UQopbb/DYqrKROJPNw6MV1j+2z/OP4/tkJMbCUaYibpEZ4IQ1mF88vJOcO7mCHx8
         s+hJHHeLtGEH4j1ut7tP8Ys/HsEXh/JRm93EgDxk/umWutTZ2JdQFnHJlc5Pe+bh+Dht
         UddV4oYDjYzwkJNif78lNNiUJ6erll7V5l2mUOfG3JCw3R0IYjV3F9n1nfxiOo/rI3lg
         LWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485963; x=1796090763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oNydO2SzkAYs5DK03LxQ5roF10I5Ez36bfBcDGkOKnM=;
        b=hlePiRuTlcyW60l3FDducoXerM42kdcsjLgu1abxl3ynyqXVAvUWEVGK+E7Xu69L5e
         KGjpSDz6AUUmfvQY8vk0Uk3HeumgdxSSArcocsn2aNPiaNChSdHnPWCejcxTziwI07bW
         nnmNdwiTLlHqjDcAIdJUSIYF4HBlfNn2JJ9n093NQypfUAOyI3PIGRvDMfeWc/zXFqRp
         01+VTuEzJet4aZb7WXvJQI1R93UhlLoYrmSq5qcssh7PoB6utp5fMkwS+MspkcPapn+Y
         l7Fk7fgbtA0q8mDk785f1w689it72Pre7OvXrWH+kCtvYoOF2pMjHz6bbOMnpClgqNF7
         uYbg==
X-Gm-Message-State: APuU4Z8PBn4/RmjJHESmaRRJovM4oJQLjs1/x4lLZ3yqYtPiyvDJM46V
	5IGJ0VP6xKrlm2AQahqeO7acI30JE94Xe5cdSHDYrJn1skvNfHcReOiuYt3X0ECVuw==
X-Gm-Gg: AZFdTZel6hmQ3V9wZBXBam1HfQcQuxAag9HCSogIaifqYJ0tTQ/34t8Qcj5E1/rpT/U
	MZieu0tq/sIvqTUUlUrjN6ydY6q3zj6TYuk2Cm/eU8+8D4+xa+MG4wrhOGJMG0zzqCUFYS2XRno
	VfHrqnkdQvpIe1mS7fpSDVJ9MwcMYdOmpdJNy1slPEW35GpSpvbQlceQdx1nOZmgb5zlAzCJqm4
	xjfeN2PW5r1ISHlctvFYd0gfpY9AFvJW6kcDWNLBgvA3l6eYuG/hcvcrm2OlszIcrqXkUkALJ++
	W5/1nQjYSyhk65HLLWZF0mijP4/6HJnZFTEHg397lTYaJLcxXK0N4wOr+jUiZtwMSaTa2kuJib/
	9s9qePGQfYQZNHwDoZM3AEh+gwVQ34/4+Hztwko45zOKYLAs+CKPa6KLl563FJIQiC/Ocm3knwo
	LHohbij8BmRaQyP5VMVfsfV3F0rmflBpRJK6Ed7ud2rYjhMUnkcd12NY9CuqY2zO/d2/eqLCsKQ
	cUTnS1NWCxWtnp8KeYQYLU/o7RANEDT92aObFW1KeUohiiDzCydBnj96EhRa03PPbRoB9igYgy2
	OblvUvqReFYjhs9KuxeUPFfvDVPAr79SR2ijQ+piwCSs7uBMvfZalEE4eDkkswgBqKlx
X-Received: by 2002:a05:701a:cc95:20b0:144:fa57:c617 with SMTP id a92af1059eb24-1b5568f1200mr12546693c88.34.1795485962869;
        Mon, 23 Nov 2026 18:06:02 -0800 (PST)
Received: from p1.. (209-147-138-4.nat.asu.edu. [209.147.138.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm30515502c88.3.2026.11.23.18.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:06:02 -0800 (PST)
From: Xiang Mei <xmei5@asu.edu>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	co+1bf8a8f813116ec5@bugs.sh,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH wireless] wifi: nl80211: reject ADD_LINK for an already valid link ID
Date: Mon, 23 Nov 2026 19:05:59 -0700
Message-ID: <20261124020559.1701707-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nl80211_add_link() does not check whether the link ID is already in
wdev->valid_links.  Re-adding a live link overwrites its address behind
mac80211's back, leaving two links with the same address.  An AP_VLAN
on that AP then fails to set up its links, and
ieee80211_update_apvlan_links() dereferences the missing VLAN link:

  Oops: general protection fault, probably for non-canonical address ...
  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  RIP: 0010:ieee80211_link_vlan_copy_chanctx (net/mac80211/chan.c:2530)
  Call Trace:
   ieee80211_vif_update_links (net/mac80211/link.c:54 ...)
   ieee80211_vif_set_links (net/mac80211/link.c:473)
   nl80211_add_link (net/wireless/nl80211.c:19681)
   genl_family_rcv_msg_doit (net/netlink/genetlink.c:1114)
   genl_rcv_msg (net/netlink/genetlink.c:1194 net/netlink/genetlink.c:1209)
   netlink_rcv_skb (net/netlink/af_netlink.c:2585)
   genl_rcv (net/netlink/genetlink.c:1218)
   netlink_unicast (net/netlink/af_netlink.c:1362)
   netlink_sendmsg (net/netlink/af_netlink.c:1921)
   __sock_sendmsg (net/socket.c:800 net/socket.c:818)
   __sys_sendto (net/socket.c:2283)
   __x64_sys_sendto (net/socket.c:2290 net/socket.c:2286)
   do_syscall_64 (arch/x86/entry/syscall_64.c:89)
   entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
  Kernel panic - not syncing: Fatal exception

Reject adding a link that already exists.

Cc: stable@vger.kernel.org
Fixes: 7b0a0e3c3a88 ("wifi: cfg80211: do some rework towards MLO link APIs")
Reported-by: co+1bf8a8f813116ec5@bugs.sh
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 net/wireless/nl80211.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index e7dd32880598..1059c4aa539f 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -19670,6 +19670,9 @@ static int nl80211_add_link(struct sk_buff *skb, struct genl_info *info)
 		return -EINVAL;
 	}
 
+	if (wdev->valid_links & BIT(link_id))
+		return -EALREADY;
+
 	if (!info->attrs[NL80211_ATTR_MAC] ||
 	    !is_valid_ether_addr(nla_data(info->attrs[NL80211_ATTR_MAC])))
 		return -EINVAL;
-- 
2.43.0

