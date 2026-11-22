Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795359943;
	b=sLVx23RTTtpLOvyayU2MYAfcEvl64yhTQvt2OO06VSpPCK2UU+zNMe2v+Dcf5TUcJw1D
	 GhNBWJeCKZR6zfWg326q/6qZNc++IXr6iBVnZKwZKQ8qPxGdv3gBKLYWitdow4tPjRdCi
	 qEnhLTkItjCDnS1ZqsN4rLuAxMkL5o3FECC8ZgoSM6ynOkdmcSQIMBV8QrKfpBwPfxd5o
	 mytbFRIngfDBIvXdO1DBoCHZ7FvO30Cnddn4NLsxZn0h16wkABjEZYcA1maLS0R6eklD6
	 OAANF8JT+m1eVDN1eHEVNGRl1Ha3aaw1Ai2PdnMEixoAqKcYa1VvlkPQaQEw6RsJ5Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=b1vslv/xd6g0N7/NwwLfMy8odTd6iLnLaTF0qZefTCM=;
	b=APPkh0nqlRCrJMpwNmOQJ0Eevg/IAYWf5PkWtheyKRICcnqrTmdHEm/niWV9AuzWqQGu
	 KnBA6l5xOUvEJyxLy8HwnogCzjCKO70igdpF4Xd2wRdbvf/SKc7vazU4Ree3Sr0piFReA
	 sYKwAblQZrYmXyt34lpCv2oJOp60tJ3JC1lcB9HvRgauBWjn9Mskp2jrNL/obsKEqMVrT
	 icswvSzBO/Fpo0uhqR9F124Dx1kqW5krHegsBZivs+t6+QEr49Qhsy07Keo1MQZPb2av5
	 OpHxrSW4HeWa9a0bc9YytCj3fmjxWgc6IA96RKSXRRC6wDlrjp98tIr2QK+vyEB9LYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=lBHpmyfs;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4034E606A685
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 15:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4034E606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=lBHpmyfs
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c5118deebcfso355665166b.1
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 07:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795359940; x=1795964740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b1vslv/xd6g0N7/NwwLfMy8odTd6iLnLaTF0qZefTCM=;
        b=lBHpmyfss0Te/LtmWO63+2BBcEuCAts5z0mXA3nbqDcci6oC+zJGiYcoT2u1dThrf+
         /DLGykdY80C5dlesEQ52s5If6vrdwiCvux3woEzz1Ucmq2P7eIB+XegDKpA2z6URm7P0
         ERhtOj0DpD9j1mVFLQrfMD/pUWgfyzg99eHTcUkMXqUasA9ZKvUmCgSFiJEqx9fAtbhl
         YKA0sMhmThBIwgcK004oQLzHi062dIutqrfFnRKgL5498MHzEyWrZAQ9xPsqFSBir1Vj
         RvtkQJTHataOefQLcWrTZ0HKYYqaMAKP4tZBCnUkrUWPBR3v8dSzDh7xMLEtJQ77BmSh
         aGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795359940; x=1795964740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1vslv/xd6g0N7/NwwLfMy8odTd6iLnLaTF0qZefTCM=;
        b=xpZ8sUNMWER8SJQvUzttfkjzi0XGwdOSI3y1yE4wQvBLRBQIjUqKEKM0sd3otcLs9F
         ujwK0VJdVyy0cwDr5/3EfyWHroo5gIB783ceiEX7Z4vh746s5eu6v2WgpCdzrrSFMTDi
         XBCl/IBTyGlq9aST+w+0nW8At+8F41EHEmYV3My/t5K/056YQxBFc5MpyVB7qw7vBnQk
         KvvRPhXQBVMEQ89+hgJ8EQvyFBwAu0r3b1IApXeeSOWj2ahcUFwt4ALMNMppRN5gk8uI
         qLESvt4LSZWvXbLueO8LV0OzaWT4ebCvsH6Z9A369lmig3B7URudFRXahYKTiUm6dYBP
         AazA==
X-Gm-Message-State: APuU4Z/TzUb6Tyh7RSkG6joREdwF3Lnrr61WZAPU7B/3pMePAFCLqxzz
	d5W4ve/RjUJ+FqAc6zf0yD3UU22LAPxk5LRXe78Txonv9pH/t7tQyfamdvX474iEnA==
X-Gm-Gg: AZFdTZf1DY2TvLgcsBwaeZbaggkByfHDFnkwVLl4dnLsMRev3rH9uewKO+3f1+yV9zB
	SpSKCbr76SMRbnkjGR80aiCb2tgkKqF77qFFo2/NEtn4bL3jP4faIE8BTUawbtDkXhekgN4qPQw
	gayUkRaAlL4Yyy4DgQN4wM8/u4nTfwoEO194cO2sO6Ci9FEDOdnLXbniDYg+GWj+D00xNQY9NBn
	zV3sPiAvhoGeYtL6Iz6qa87ef9L80KJO/QGzEqUsml76krsbgK4y3snJBnboqc7HuBdWr3kkuvx
	gcgm4T2l2acKpDa+Q4CdjALXzT2g02A86xhqaZ8U+hUwoezw/GtTzS74zV4nVJ/fb7Y42Zfi+YI
	zCGfyLW5AdPpLWISvPIxPejZ3rtfI+ckx6Aidj1F8xI9NTnlYYF9spgdjl6GQZ1ze+qotpV35zj
	JhhIpgSSMJJWtNo2NBbpEioc4blMC5zDIJnx07vFGmt4HPBXiEu8mAKYsgVA7bZEk1DcUIyIuxP
	zSkr71ABnklzqZ1suDuY4Oro4a0Yipk/3fbkcVd6nBbhGIGAKwy+21P6pEbWpCtplOHE98G0slC
	eoQoQou//46ar/MWeZipdPvYy7qsPO/cKO5+rHULnVXcWm0+qd01va8hbDDXYx6wUEEVSIhGVpe
	IWmAKJPqS+hsW7UfMxSamlA6j3WATU2t9gDL6Ztl4AbiFQcQfEcYMUSbOZJZUobWWhwvAjKl7IU
	DL/m0KkJuVUAlYMeQxiPgjLJbL5ZxgwRcBLhnDSI4GBYdHkDD0p8n7cD61t78zRJgyF2zM0kttJ
	6UdhOHkUetNUM7eedH8TGRZ1CZKbGhnrOyzRBnCw8ZRUrE0X+XCItUnIH2rVrTUQ3I24MKjnmm/
	v4uxpmsrc+OQna82QMZNvnwrwhOJEvxbfBd1/v9sp6Rv9p/sHkClRQqhZkgyR0ivKK/jRiiwfFf
	jMEihh/KdcPQaojIm1DQ=
X-Received: by 2002:a17:907:a890:b0:c2d:c739:30e1 with SMTP id a640c23a62f3a-c513ab14a58mr789493566b.32.1795359940505;
        Sun, 22 Nov 2026 07:05:40 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247132f00a1bce02c0b4f040c.dip0.t-ipconnect.de. [2003:f2:4713:2f00:a1bc:e02c:b4f:40c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae65965sm326009466b.23.2026.11.22.07.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:05:40 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: [PATCH wireless-next] wifi: mac80211: find the station of a freed 802.3 frame for AQL
Date: Sun, 22 Nov 2026 16:05:41 +0100
Message-ID: <20261122150541.3117507-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

ieee80211_report_used_skb() returns a frame's pending airtime to the
station found from the 802.11 header. An encap offloaded frame starts
with its 802.3 header instead, so the lookup finds no station, the
station keeps the charge, and once its leaked airtime exceeds its limit
ieee80211_txq_airtime_check() stops scheduling it until it reassociates.
Drivers with AQL and encap offload reach this through
ieee80211_free_txskb() wherever they drop a frame without knowing its
station, for example when firmware recovery returns the frames it held.

Look up an encap offloaded frame's station with
ieee80211_lookup_ra_sta(), as ieee80211_subif_start_xmit_8023() did on
transmit.

Fixes: 50ff477a8639 ("mac80211: add 802.11 encapsulation offloading support")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
I used Claude (Anthropic) to help write these patches.
I have reviewed the commit message myself and edited it where needed.

 net/mac80211/ieee80211_i.h |  3 +++
 net/mac80211/status.c      | 17 +++++++++++++++--
 net/mac80211/tx.c          |  6 +++---
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index a74b1e711733..88f342742e14 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -2313,6 +2313,9 @@ netdev_tx_t ieee80211_subif_start_xmit(struct sk_buff *skb,
 				       struct net_device *dev);
 netdev_tx_t ieee80211_subif_start_xmit_8023(struct sk_buff *skb,
 					    struct net_device *dev);
+int ieee80211_lookup_ra_sta(struct ieee80211_sub_if_data *sdata,
+			    struct sk_buff *skb, struct sta_info **sta_out,
+			    bool bss);
 void __ieee80211_subif_start_xmit(struct sk_buff *skb,
 				  struct net_device *dev,
 				  u32 info_flags,
diff --git a/net/mac80211/status.c b/net/mac80211/status.c
index 5d1807ab46ef..cde6f0cfa0ed 100644
--- a/net/mac80211/status.c
+++ b/net/mac80211/status.c
@@ -769,11 +769,24 @@ static void ieee80211_report_used_skb(struct ieee80211_local *local,
 		acked = false;
 
 	if (tx_time_est) {
-		struct sta_info *sta;
+		struct ieee80211_sub_if_data *sdata;
+		struct sta_info *sta = NULL;
 
 		rcu_read_lock();
 
-		sta = sta_info_get_by_addrs(local, hdr->addr1, hdr->addr2);
+		/* An encap offloaded frame still starts with its 802.3
+		 * header; find its station as the transmit path did.
+		 */
+		if (!(info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP)) {
+			sta = sta_info_get_by_addrs(local, hdr->addr1,
+						    hdr->addr2);
+		} else {
+			sdata = ieee80211_sdata_from_skb(local, skb);
+			if (!sdata ||
+			    ieee80211_lookup_ra_sta(sdata, skb, &sta, false) ||
+			    IS_ERR(sta))
+				sta = NULL;
+		}
 		ieee80211_sta_update_pending_airtime(local, sta,
 						     skb_get_queue_mapping(skb),
 						     tx_time_est,
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index cb9ecac25a9c..7b1fcf3dea7d 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -2626,9 +2626,9 @@ static inline bool ieee80211_is_tdls_setup(struct sk_buff *skb)
  *  - NULL: frame will be unicast to a yet unknown station
  *  - ERR_PTR(-ENOENT): frame will be group addressed
  */
-static int ieee80211_lookup_ra_sta(struct ieee80211_sub_if_data *sdata,
-				   struct sk_buff *skb,
-				   struct sta_info **sta_out, bool bss)
+int ieee80211_lookup_ra_sta(struct ieee80211_sub_if_data *sdata,
+			    struct sk_buff *skb, struct sta_info **sta_out,
+			    bool bss)
 {
 	struct sta_info *sta;
 

base-commit: e1dd8486807c1acf9551250b7f81e116a21e6ad6
-- 
2.53.0

