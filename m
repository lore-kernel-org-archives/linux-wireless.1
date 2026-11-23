Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795424359;
	b=BrwCNzLGwYqoYYp3NdhiRHn0qPR4u7lScWRyxdJoiKGcK7RAwEjG7eBTc7YKCTgVq928
	 pft5trZ+mH/BMJTSNyKUc8PekUTyJAJQIS9Qt/FVABui6TtVLzCA2s/omK2b70igxVOxX
	 3IGBnuxXKC5/wUhwisnU64LI79yetk8i1LGye+YUZa6HdEa7djGWxRSoVgmwzq9/Lyi6w
	 4AlOkEsdHGhk02pQOZ4OC3iyB7A1/LAhf2V4DXIN5EXc6zOfy+vsfIEHD2RU/kWhxtWcn
	 e2PZg7Rkh8UOJxBrpWgLnQlQ3+clOLjOHE8KD5jDemt/T0a4OOU9k8blf6PSlRlX+fg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424359;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4dsapVxeicJNXFXh7Rqlobi3mGfdBdEB9gkYyYbqMe0=;
	b=j+tkwHWK7BlO68L/GKyrBh5V2mboji2xMsAQgPqeEh4TxrunqU44AO3hRlnGFTWipHuM
	 GlUzls19IXtebJvW4VrebM06OTKjvCtj4oAc4MAugs4B1Ac2oWHRftTBKjoF5ZyPT+HBT
	 qLvwW4++BhBgfa3v28v+i31qVei1AbscmDy0QpDMQxuPHJRYI1dGIXUPkaP3h/xXFoQJ+
	 RamSbmbhNth1BRTkQw4wNd+8vrdv5er6H5353NjPKPi495VJERYA8u2fsdThG0LNA/mfN
	 GrRW9PegXAOqiEStNs2dIHifEredhIeMWQLm3CtOWgTf3ok6cWKvwbbeDVKHi9plhpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hyl5QEOm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5838F606A31A;
	Mon, 23 Nov 2026 08:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hyl5QEOm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795424359;
	b=KSw61rA1/GD2+SdqWUfoCAz4pfWFqSLl5Lx+Le3O6cpNyLpnWIG5pgDHP2FSuYSWEtXV
	 dlfMwWRzaGdD/mR5v2itdq5awMLRMsKrAPHF8RvJKKwHbwQylmqASWRH6ZxJotdKsSsG0
	 /Zfgj/tq8jnCTIzfwAjeojI5V9r5cmKdzLJbt3rUGwH3WrL6sNfN/Fqhs2b4rrD9CRcml
	 FSCZsg149hAG2zSLnaVgyKlHILCmt+QcwgHI9pOF68e2QdkeqQjg5VOGy8+Sq/K7Ivkij
	 gFYc0/PCjMaLkKlTY+OzEcAFF7NeWTP6ZON4644ogYSWDHa1hs/JIAgpZE+BLb4yL5w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795424359;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4dsapVxeicJNXFXh7Rqlobi3mGfdBdEB9gkYyYbqMe0=;
	b=jzHsaApvgEHqqyrPptxOQJKyi+re9HNT/8Zh0PeDGkcPuASVxOlpVNogmeI7FPd0SH6z
	 DbutWknHtL8PWTcfJ0+DjnlQD8iDIcv1YOyfZbweEtLDYe64QY1dbjP30Vc2WH57ZZ5KV
	 1+vt/iAaW64qIjWNuMyycP7C6KhYuSpVP+TbrsO4ureBwg4e04UQ2fUSmYI+kMGj8sdPf
	 wN2pDcOpUzl/00Wr2uu57XhqXvv1zn87M/tHOs6CWrMM+GjhiyYYakUCx4OosMs9YrX3p
	 AH6QybU1FOY5DaKrI7HhihUVVwwErarlwUooWKZwgWG5etImt5NL4bW5xOfLpHM8OzQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5BF81F000C0;
	Mon, 23 Nov 2026 08:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795424359;
	bh=4dsapVxeicJNXFXh7Rqlobi3mGfdBdEB9gkYyYbqMe0=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Hyl5QEOmhLbK4HO09ISj6ypTokj9HOGLEvLVV+f6ZeSHatUHTYuusfT84yvpj/Fet
	 wMh8mar2iQGyEIM+O7+ETKQLkUb/pmz4FLR6Oy0WcA0II+ptHXE9GWTTkGFg3qq7hT
	 7/e6sJlBdHgOe5KBTgwRX86ysPDd0HwFRJ5DIlIKxKaBoyoGia/S+UFQcAWdRm4ivV
	 I4WHK16NRSUhtq0Hs9mVT6NgmrQzazOcDqPJBMBu+MAAem0DvFfva1ytoYOWRzxfUS
	 PAMHIV1L7a8MdH/ugPe31NIB58fA0I7qcbkXpNdJB7wpJ4aaBYreNJnnnbDKmcFKdo
	 Y0492vUm9MMwA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 184B24C3DB;
	Mon, 23 Nov 2026 08:59:01 +0000 (UTC)
From: Andreas Claesson via B4 Relay <devnull+andreas.aclaesson.com@kernel.org>
Date: Mon, 23 Nov 2026 08:59:00 +0000
Subject: [PATCH] wifi: cfg80211: don't warn if the joined IBSS has no IBSS
 BSS entry
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-wifi-ibss-joined-lookup-v1-1-0d84745eac94@aclaesson.com>
X-B4-Tracking: v=1; b=H4sIAFMABGsC/yXMPQ7CMAxA4atUnrFUeyg/V0EMpHbALUqqmFKkq
 ncnwPgN763gWkwdTs0KRV/mllMF7Rro79d0UzSpBm65I2LCxaKhBXccsiUVfOQ8zhPyXgILHUK
 UI9R6Khrt/TufL3/7HAbtn98dbNsHnSk4FHsAAAA=
X-Change-ID: 20261121-wifi-ibss-joined-lookup-27db2d18bfd9
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795424340; l=3767;
 i=andreas@aclaesson.com; s=20261109; h=from:subject:message-id;
 bh=m7h+52YKRxR9ZLb3Ud63XWtQSFI2V8VSZyV0cDOPuJs=;
 b=yVvqn1HysF3ujS3h/7QVcvjXvSDAnOKJu/ORYIRi70GOGGQc8x0+5v3oegB3ziKkpriWcRF6R
 wPduLp0uMb8BoSH4uliiptIKMvtqehfdZq2XpeezPJ1Wv9yuxy5WbTM
X-Developer-Key: i=andreas@aclaesson.com; a=ed25519;
 pk=oC+38UX0rqcrEjNMgnKAF1zmrTUMbQ2aH/P5Z4TZOIQ=
X-Endpoint-Received: by B4 Relay for andreas@aclaesson.com/20261109 with
 auth_id=1465
X-Original-From: Andreas Claesson <andreas@aclaesson.com>
Reply-To: andreas@aclaesson.com
Content-Transfer-Encoding: 7bit

From: Andreas Claesson <andreas@aclaesson.com>

cfg80211_ibss_joined() looks up the BSS entry of the IBSS that was just
joined, by BSSID and channel and restricted to entries with the IBSS
capability, and warns if it does not find one. mac80211 calls
cfg80211_inform_bss_frame_data() with its own probe response right
before, which is expected to guarantee that the entry exists.

It does not. Beacons are added to the BSS table from the RX path at
any time, also when no scan is running, and the wiphy mutex held by the
IBSS work does not exclude that. A beacon with the BSSID and SSID of
the IBSS that does not have the IBSS capability bit set updates the
same entry and overwrites its capability. If it is processed between
the inform and the lookup, no IBSS entry is found:

  wlan1: Creating new IBSS network, BSSID 50:50:50:50:50:50
  !bss
  WARNING: net/wireless/ibss.c:72 at cfg80211_ibss_joined+0x3a7/0x5b0
  Workqueue: events_unbound cfg80211_wiphy_work
  Call Trace:
   __ieee80211_sta_join_ibss+0xdd3/0x1660 net/mac80211/ibss.c:375
   ieee80211_sta_create_ibss+0x300/0x480 net/mac80211/ibss.c:1287
   ieee80211_sta_find_ibss net/mac80211/ibss.c:1416 [inline]
   ieee80211_ibss_work+0xd9b/0x1060 net/mac80211/ibss.c:1637
   cfg80211_wiphy_work+0x29e/0x420 net/wireless/core.c:610

The beacon comes from the air, so the warning can be triggered by
anybody in range of a station that is joining an IBSS, and the join
event is not delivered when it happens.

If there is no IBSS entry, look the entry up without the type
restriction, and do not warn if there is none at all, since the RX
path can also unlink entries.

This is not the trigger fixed by commit 2531f6539d2f ("wifi: cfg80211:
validate WEXT station BSSID"), which is in the tested kernels: the
BSSID here is a valid unicast address.

Found with syzkaller. Reproduced with mac80211_hwsim on wireless
(dcf495789037) by joining and leaving an IBSS with fixed BSSID and
channel in a loop while injecting beacons with the same BSSID and SSID
and the ESS capability. Without this patch, 124 of 778 joins hit the
warning and exactly those 124 joins had no NL80211_CMD_JOIN_IBSS
event. With it, 1456 joins gave 1456 events and no warning. The case
where no entry is found at all was not reproduced.

Fixes: 04a773ade068 ("cfg80211/nl80211: add IBSS API")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-mythos-5-2
Signed-off-by: Andreas Claesson <andreas@aclaesson.com>
---
Found with syzkaller on 7.4-rc1 and reproduced with mac80211_hwsim;
the reproducer is a small C program that I can send if it is of use.
Based on wireless.
---
 net/wireless/ibss.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/net/wireless/ibss.c b/net/wireless/ibss.c
index 81dff0bace286..cb33fb403b786 100644
--- a/net/wireless/ibss.c
+++ b/net/wireless/ibss.c
@@ -69,7 +69,17 @@ void cfg80211_ibss_joined(struct net_device *dev, const u8 *bssid,
 
 	bss = cfg80211_get_bss(wdev->wiphy, channel, bssid, NULL, 0,
 			       IEEE80211_BSS_TYPE_IBSS, IEEE80211_PRIVACY_ANY);
-	if (WARN_ON(!bss))
+	/*
+	 * The driver informed us about this BSS, but a frame received since
+	 * then may have changed the capability of the entry, so that it no
+	 * longer looks like an IBSS, or may even have removed the entry.
+	 * Neither is a driver bug, so do not warn about it.
+	 */
+	if (!bss)
+		bss = cfg80211_get_bss(wdev->wiphy, channel, bssid, NULL, 0,
+				       IEEE80211_BSS_TYPE_ANY,
+				       IEEE80211_PRIVACY_ANY);
+	if (!bss)
 		return;
 
 	ev = kzalloc_obj(*ev, gfp);

---
base-commit: dcf495789037ab78d8ddf5844239cf85d92ac5f1
change-id: 20261121-wifi-ibss-joined-lookup-27db2d18bfd9

Best regards,
--  
Andreas Claesson <andreas@aclaesson.com>


