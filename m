Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352320;
	b=QGCBP5+uw9FxMGQgLJ5tmioBRKdxwDlTO7jYJYoS0bbeJPmDuPwThke3osFqOANHW01s
	 9GllqgYZuEFl/niMEaJvfLFHALFSIIHRxXY4DiQ+2kQHIiS60+KYtCHhe/2/YeSSHjLlH
	 94fZNXv2tkUyvOTjMSTLn0bLCb6h5Id3jHq0o4Yz2QwftJBdtBSzDvOD2pUppnoO9YJ2z
	 FHZl/OHL3QqoeLozahHNNiOmjsdCW08jSUCU9Sncop3KROsAEAy1YO0ChqBLFkuV1Ytyc
	 FtVmvONLAtqiKTqozWOj+DsGRdc0h+zy0vRDMw+04E4o2Ilb1/9v2XQwvSYBQMGPlqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0Xojv1PznqkjFmN7+yFbdkDsoaJ1qnF0z52IzXttlsY=;
	b=HFCagneKIBmk9ReTpZHxxxeRM1j1epzAxSfta6/1UUO7VgYq3EQ4jOYcABqgH9HdaeBZ
	 zmX5pTA89kXLVZwmWrJFlQFDr1OQcUEjUJ177jCsFgCVu9Qvp2w/NJIZ63bDAuLtZCk9Z
	 F9zAtQccPyJFB/KmaLL4Bf5tIxM1A4qFlgj/TvTLd0nsqjiAafFLggA6dTr/Z/jWotNK2
	 MD+erfmtYbfasH6L3g+BZUrUfi4LU7uJCnycCrj56LxhnbXG0AZ/jB5WB2M3H1rlEXdPd
	 L3IhRqj9LgCNsbjX7+1tABOYZuAgBaqyT6MVePFrqOIBWYipVwGKh8oleMbyxP54Opw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uD+z7qSA;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAF6606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 23:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DAF6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uD+z7qSA
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso456850166b.0
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 15:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794352319; x=1794957119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Xojv1PznqkjFmN7+yFbdkDsoaJ1qnF0z52IzXttlsY=;
        b=uD+z7qSAdVaRZ5a1Bu+tmGjJ+TCYC4Pfzu+7FuW0YndsnDPEqhg/+06tEVX8qaPT1N
         PRIECgrit0Rwd8l4mz6sZjsttkqHJUpEh0xmMzi5SsjtfcjqffYaqr9CErHq7qW6y4vN
         MIrw7X2kEzahmRtBDi54RiIAg81XZCiJ9aixelzwiVAWrPgpP6akLl6IpfjqTxOCbuvM
         VVVAdm1HM/pz8LY3SNynrWbw5IxbE1rGKS0imkjtW3wrgUh2n+uh0rEFILAsQ6jTeDQw
         vW6sjKpuYa3Qwg2rf5yNEqEFB0uhSEoEpPI8e4aAxtdyt2sUAwOST7+REu+HYHBK5OHw
         Wj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352319; x=1794957119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Xojv1PznqkjFmN7+yFbdkDsoaJ1qnF0z52IzXttlsY=;
        b=qwLzK2KnzRbCRLH7o+ougIAiIsiRbnoPUTITO90TCNqKnt1kc9sc8OHj8dJcEFkh9v
         rSxyfTneniP6OBvgyWCvg2MPhFPZEBNKo1dMqqpZh3h730fb07kGzsGvoQki7c8sawBK
         Awm+4VXY6U017LvmZQUsL6jgSGBr6G4pBkfuRv4RjRfV4fKAhqoNkeaAUBzvrXThPKSU
         JtDJplT5agFMXi1YwwneAUUm0rZAhZFTKKgIlJFG12KnOQ1Gl9uID1Qq6tdDeJkfNnXT
         byr9hnD16bofv7oxYH9L29kg/PyQ+EIvCGVFtEVsorvLvF23Bm+tBKCpmesx/WIQ+6Un
         sUMQ==
X-Gm-Message-State: APuU4Z+VxUSPfeUdKicj7mgll53bwm6zLwsVy5kOW5JnSO8E9orE8sBD
	ep6J9QMc+HtXJ92HK+/7mJA4rokbnNIMeK6zVADpZdJtZzuvGu4m/40F3Tt/ge1y
X-Gm-Gg: AYBFou08PGoLZVW4HcacFgZn6rNv9vEx3dao5NI49Yufp+daH4zRrZjlpkxFhk/n2mz
	hXEtR4bp7ZFeRUmAtqZKjWy+UJRVOOeFJO7xl8AmW5x7u1G14asxsWp7BahRzz5rDk+b5+iZ+DP
	k+th2ws4tsEhpK2gHoHD1ccBNeZart9WsBKr/fxsrCwDx/Cz5mzDOv/LSEG+fpnwAOxZRG67pGh
	fy4yMpj7hVxHkN5VoKQk1flzBrRfNqP3uSbRVvcV/56invYbIDYdRYRuUu2wSKiBLms4g3si8tV
	2y4U3inIOMThg2bJqPHNU96GYRZHNzs4pFFjEP5FhQEkFs8PPccb2FnZT1wPmdmK7bXCxGdBkf/
	wqyUdqv0DzF/eMgwJT6L9o8yvC5kLCWKT3WwCFc4KW0T7PhlypEZ7ma9wNzGBRaRtzmnzjM0MvR
	iPpXuX7ZK5vEeZbyHShCAbW6XwvbsDBc6ylS+gIiDvWEwfH47+SlgSDTSUI3aojx3o2gS2rkAe4
	Q5s2LGYESqk5JhuxUx6QTosjPWkInPkOtxLGF3WXh2UWmsKmtHhIuG7XRShdAqE5mTIPZREt/dk
	TB4hF41qS4jfEpxhhFU35qqDUnE6FOEJXtBTIptzvnhQ1zm0WWq8ISY=
X-Received: by 2002:a17:906:dc91:b0:c41:1781:a2af with SMTP id a640c23a62f3a-c506338c761mr81873766b.9.1794352318510;
        Tue, 10 Nov 2026 15:11:58 -0800 (PST)
Received: from localhost.localdomain ([2a13:e746:396c:c600::31b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7578ece26sm1667694a12.24.2026.11.10.15.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:11:58 -0800 (PST)
From: "Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	"Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
Subject: [PATCH RESEND wireless-next] wifi: brcmfmac: delete the flowrings of an AP that stops or goes down
Date: Wed, 11 Nov 2026 00:11:45 +0100
Message-ID: <20261110231145.206744-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
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

An access point has a flowring per destination: one for each station
and one for its broadcast and multicast frames. The ring of a station is
deleted when the station leaves, by brcmf_proto_delete_peer() with its
address, but nothing deletes the broadcast ring, nor any ring of an AP
that stops: brcmf_cfg80211_stop_ap() deletes none, and on the link-down
event of an AP delete_peer gets the address of the event, which names no
station. A new start of the same interface then keeps the old rings.

Seen with a BCM43684 whose AP OpenWrt starts twice at boot, 1.2 s apart:
the firmware never read again the broadcast ring opened as the first
start ended. ARP and every other broadcast of that BSS were lost, and
once the ring was full flow control stopped the interface for all of
its stations, until the ring was deleted hours later by a change of the
interface type; the firmware then served new rings normally. The vendor
driver deletes all the rings of an interface on a link-down event.

Do the same, and when the AP stops: brcmf_flowring_delete_peer() without
a peer now deletes every ring of the interface.

Fixes: 9a1bb60250d2 ("brcmfmac: Adding msgbuf protocol.")
Signed-off-by: Kordian Chmielewski (mlody1212) <kudzo51@gmail.com>
---
Resent unchanged: patchwork did not record the posting of 9 November.

 .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 14 +++++++++++++-
 .../broadcom/brcm80211/brcmfmac/flowring.c         |  5 +++--
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index b0eaf9641..91184bdcf 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -5480,6 +5480,11 @@ static int brcmf_cfg80211_stop_ap(struct wiphy *wiphy, struct net_device *ndev,
 		/* first to make sure they get processed by fw. */
 		msleep(400);
 
+		/* the BSS goes away and its rings with it: nothing else
+		 * deletes the one for broadcast and multicast frames
+		 */
+		brcmf_proto_delete_peer(ifp->drvr, ifp->ifidx, NULL);
+
 		if (profile->use_fwauth != BIT(BRCMF_PROFILE_FWAUTH_NONE)) {
 			struct cfg80211_crypto_settings crypto = {};
 
@@ -6750,7 +6755,14 @@ brcmf_notify_connect_status(struct brcmf_if *ifp,
 	    (e->event_code == BRCMF_E_DEAUTH_IND) ||
 	    (e->event_code == BRCMF_E_DISASSOC_IND) ||
 	    ((e->event_code == BRCMF_E_LINK) && (!e->flags))) {
-		brcmf_proto_delete_peer(ifp->drvr, ifp->ifidx, (u8 *)e->addr);
+		/* the address of a link event of an AP names no station:
+		 * the BSS is down, and so are all of its rings
+		 */
+		if (e->event_code == BRCMF_E_LINK && brcmf_is_apmode(ifp->vif))
+			brcmf_proto_delete_peer(ifp->drvr, ifp->ifidx, NULL);
+		else
+			brcmf_proto_delete_peer(ifp->drvr, ifp->ifidx,
+						(u8 *)e->addr);
 	}
 
 	if (brcmf_is_apmode(ifp->vif)) {
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.c
index 35cbcea0a..b9570d638 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.c
@@ -432,9 +432,10 @@ void brcmf_flowring_delete_peer(struct brcmf_flowring *flow, int ifidx,
 	u16 flowid;
 	bool sta;
 
-	sta = (flow->addr_mode[ifidx] == ADDR_INDIRECT);
+	/* without a peer: every ring of the interface */
+	sta = (flow->addr_mode[ifidx] == ADDR_INDIRECT) || !peer;
 
-	search = flow->tdls_entry;
+	search = peer ? flow->tdls_entry : NULL;
 	prev = NULL;
 	while (search) {
 		if (memcmp(search->mac, peer, ETH_ALEN) == 0) {
-- 
2.56.0

