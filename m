Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794023691;
	b=ZeDeJIAXIy/jAvNMVyag0rz0bxMHjMyjYZl1ZUgetJzhUwDmHeo3TNrtK0gGyBzupJa+
	 pqym2e4O1U4Ag36+BEygY9ACuePYq8Nv0f/l37WdX8YpXqUhlZOBeqDl98cUtzCrgiyLr
	 ocktNEjye7eiegRHqFQfegBpCKiEnNmjByT6pccXdc4fq32QQGdfdOPQfXw9f/cWF0jpu
	 hDsOeTWm3ty2aGTN57T8UMY/1T8RNKXyI0L89cug2CKZ3q5AsXDdJDJXkaArg9pH7lQ2d
	 iyS5Id7TjkxmP9tDAaizPmATZY/tRV3kE2FoZC08F48vKunHCKjgPTumoSoaSvxKHWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794023691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tjIchs3yMAil7B1EpG8Bvz6BwYwvjTpx2u7hvOdCalE=;
	b=E30rMZ/eqtWm1VzHsRBdJLW9choEvjvbuiZL6jkIaKWwThIGwYsFULX+ZY6dsNi3VqrA
	 nKyKvcchxaPyw4Pg1AzdwpqBkP7C/kLLs+U4O4vR8Pkb5n0l0oxmtF4cdYbNwbwifbJoD
	 ojuC0GrSPixCsMmkAVzJ6LKcWUzpxAgBQVuRNknXREoJcVlsdlqSDtQTiLg4Sq5tqRkEu
	 y2ngzrw/EOIJ+UUH6H62w3jd/68FLcSt9N1pxbpwpgSi+SysHy6Q9QZqMQ7tAOlkqRl6B
	 wJJbrzRc76xtC4hG0K+u/26T2qtkBRkz9giUMlIglzCUAOOpeSnOFaDU6Wak/KFqu5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PalG54O/";
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F074C606A32C
	for <linux-wireless@vger.kernel.org>; Sat,  7 Nov 2026 03:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F074C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PalG54O/
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91ec14f4369so202306d6.0
        for <linux-wireless@vger.kernel.org>; Fri, 06 Nov 2026 19:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794023690; x=1794628490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjIchs3yMAil7B1EpG8Bvz6BwYwvjTpx2u7hvOdCalE=;
        b=PalG54O/0mzQ82l3BAUxtKh2LWMpXEd6wTQFOC6TWXIswNFtYEV6IHdY91dwz8gui9
         iqou/EidFcchCkxQUnwUUujS9MdXkyFSBCc8LYbPZIM6mr3wBhGpMr0BG1ybmdLg1Dnl
         NUrzE5cbyGb6d5k2yEpbLqyjZskmndPzBKLqbLjj7S42tl6e6Zc/pvXDxTf05mM7peZN
         r6/oBb7SlIl0Q32cpPTl18PJTnWYLFfjy2S7+8dBUbt60GU7O/AakDoUU1tl+/rmh/dQ
         vD02WikPOhWfurWOucfpyqzMYwNlNDZ4YuK69mP5AIgZluVWeVvy4lq67+BS/jcxW9ow
         uNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794023690; x=1794628490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tjIchs3yMAil7B1EpG8Bvz6BwYwvjTpx2u7hvOdCalE=;
        b=2Wqzw4i3zaICCxhsm29W5cVxfsmBPf4AWNTosgUP3EVzTNQmTp0pci/GlLUrXsFpap
         uiIS9Iv+DJMkujY7ExQUdoVSOPsGP9CDvtX+pyk4jHGc3t8bjvoMHbzKmZE6EsmGNuo4
         75UNVZu2TIeRsAcKWm9ngm1kUp+wLNBuBufuMeKEiIzWNTAtY8cD327MtHVw7L5b1++I
         HyrOIO2BZxMli/7xAlrkuIyhpXZsc4Lb19HPwc0a1Qct2hHFUyiQjAvPSUDsKtKInFfy
         6Ow5MyaidfGfad75yF98bsOfWGcQK32trMC18EDl5te9HPNj41P4sDc7Tj9NOzHob7DI
         fHdA==
X-Forwarded-Encrypted: i=1; AL+hErHnA3dogD8XartsQol9lA4cwtyDZxZbBfeI0VhrfsYS1y2qLini8iLHZruK3eM/Mblpsjih9J5q2sVGzvnNiQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9QDwHUDgDTrEjZls0v64FcFJWsWIk7jMXsWTBDHJisXQVojI1f
	d04wpcGvcNQRLlfAqlBzks9wTvkxZQNrW2QfQPbKz5mlVMXqjrfVAewmU8C8RA==
X-Gm-Gg: AYBFou27+5qswSbRCgDvRl+5iencZVLV5HOh9HFiHMi1HPZucvolsfXFyMTbWlzWlx4
	5p6GCRwOsCgqWUIKTBUp9vnqovQdDmEJvH0rZVi17RZIWYgpuiwojSiHWBKHDDt07MkLgEaDlxJ
	6LG7LKzCUdvWc1IKZYIT++toFsRLWopwdsjXv0ZVS/ZGD52dotUsqrztce0hzuNOpOrsSJJkqge
	1DsX5WmkzjAYknWtUJqLIHqbCMgC6AWBFtb30ku6eycHPB1Yse1JjeM8bhqjZwqTNnzeNDnmd71
	1M1bY8DYwJt3I1axZv81OoEUINHtLCLWL31Phd9JQXWzi2XrdfzFLboHU+eSuXMcovdO3Rarbcv
	NoDfZDTklirZKDKWMcJV00LuQjI5G3XKc/ku670xpcR+PzYsF7PCFW0pMeHtKY0EMbo6ImeIFOF
	Tgscr5tuR8496aRVKsO7bhVJg+sAYgaugYyCoM4i+4m/xNCMkJGGw1vbgwadCK6h/4g2G9mfpi1
	WSVLhnDiLoQkPGngQFQnAiU5Lk7UjGcLLViH7L33ct4RjUQQjHGuKBx4iWgSyL6ndoTunNadU0K
	oSfOTfpMDfevHUH/d5Q83mrXpyl+qSHyFzz9Zb9M5bDcjvPrq6DLuEeXNuYlnA==
X-Received: by 2002:a05:6214:c82:b0:91e:a124:d7a7 with SMTP id 6a1803df08f44-91ea927fc55mr68545316d6.4.1794023689726;
        Fri, 06 Nov 2026 19:54:49 -0800 (PST)
Received: from localhost.localdomain ([2600:4041:44c7:5c10:3958:f724:43b6:fd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acceacsm35863996d6.43.2026.11.06.19.54.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 19:54:49 -0800 (PST)
From: Christopher Hill <ch6574@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Christopher Hill <ch6574@gmail.com>,
	linux-wireless@vger.kernel.org
Subject: [PATCH wireless] wifi: mac80211: apply ap_isolate to AP_VLAN stations
Date: Fri,  6 Nov 2026 22:52:18 -0500
Message-ID: <20261107035220.50480-1-ch6574@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20E87267-920A-4FD9-9443-050AE7676E45@gmail.com>
References: <20E87267-920A-4FD9-9443-050AE7676E45@gmail.com>
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

ap_isolate is set via nl80211 SET_BSS, which is only accepted on AP and
P2P GO interfaces, so ieee80211_change_bss() stores it as
IEEE80211_SDATA_DONT_BRIDGE_PACKETS on the AP sdata. AP_VLAN interfaces
never inherit it, but the intra-BSS forwarding decisions in
ieee80211_deliver_skb() and ieee80211_check_fast_rx() test the flag on
the station's own sdata, which is the AP_VLAN for stations assigned to a
VLAN (e.g. hostapd dynamic_vlan). As a result, mac80211 keeps forwarding
frames between stations of the same AP_VLAN although ap_isolate is
enabled, and client isolation is silently ineffective for them.

Store the setting in struct ieee80211_if_ap, next to
multicast_to_unicast, and read it via sdata->bss so that it applies to
the AP and all of its AP_VLAN interfaces. The now unused
IEEE80211_SDATA_DONT_BRIDGE_PACKETS flag is removed, as was done for
IEEE80211_SDATA_OPERATING_GMODE in commit 39eac2de0098 ("wifi: mac80211:
move IEEE80211_SDATA_OPERATING_GMODE to link").
__ieee80211_check_fast_rx_iface() already re-evaluates the fast-rx state
of AP_VLAN stations when ap_isolate changes.

The issue was found and this change drafted with the help of an AI
coding assistant (Kiro); it was reviewed, built and tested on hardware
by the submitter.

Fixes: 7b7b5e56d7bd ("mac80211: implement ap isolation support")
Closes: https://lore.kernel.org/linux-wireless/20E87267-920A-4FD9-9443-050AE7676E45@gmail.com/
Signed-off-by: Christopher Hill <ch6574@gmail.com>
---
Tested on a Linksys E8450 (MT7622 + MT7915E, mt76), OpenWrt 25.12.6 with
mac80211 from backports 6.18.55 (patch applied with line offsets only),
hostapd dynamic_vlan=2, VLANs from wpa_psk_file, ap_isolate=1,
multicast_to_unicast=1, two stations on the same radio and VLAN:

- AP_VLAN bridge port with hairpin on: stations reach each other via the
  bridge, one copy per frame (before: every multicast frame duplicated).
- hairpin off: no unicast or multicast replies between the stations
  (before: replies received, i.e. isolation bypassed).

Build-tested on wireless/main (c4328134f) with W=1 (net/wireless and
net/mac80211, x86_64 defconfig + CFG80211/MAC80211=m): no new warnings;
also applies to wireless-next/main. Not tested with mac80211_hwsim.

The debugfs "flags" file no longer shows the isolation bit, as the flag
is removed. An alternative that keeps the flag would be to evaluate the
AP's flag for AP_VLAN interfaces in both rx.c places instead.

 net/mac80211/cfg.c         | 5 +----
 net/mac80211/ieee80211_i.h | 5 +----
 net/mac80211/rx.c          | 4 ++--
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 9608c07bce..cc9d2384d5 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -3706,10 +3706,7 @@ static int ieee80211_change_bss(struct wiphy *wiphy,
 	}
 
 	if (params->ap_isolate >= 0) {
-		if (params->ap_isolate)
-			sdata->flags |= IEEE80211_SDATA_DONT_BRIDGE_PACKETS;
-		else
-			sdata->flags &= ~IEEE80211_SDATA_DONT_BRIDGE_PACKETS;
+		sdata->u.ap.isolate = params->ap_isolate;
 		ieee80211_check_fast_rx_iface(sdata);
 	}
 
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index 1a6cbbb5a1..e74e30c070 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -344,6 +344,7 @@ struct ieee80211_if_ap {
 	atomic_t num_mcast_sta; /* number of stations receiving multicast */
 
 	bool multicast_to_unicast;
+	bool isolate;
 	bool active;
 };
 
@@ -871,9 +872,6 @@ struct ieee80211_if_mesh {
  * enum ieee80211_sub_if_data_flags - virtual interface flags
  *
  * @IEEE80211_SDATA_ALLMULTI: interface wants all multicast packets
- * @IEEE80211_SDATA_DONT_BRIDGE_PACKETS: bridge packets between
- *	associated stations and deliver multicast frames both
- *	back to wireless media and to the local net stack.
  * @IEEE80211_SDATA_DISCONNECT_RESUME: Disconnect after resume.
  * @IEEE80211_SDATA_IN_DRIVER: indicates interface was added to driver
  * @IEEE80211_SDATA_DISCONNECT_HW_RESTART: Disconnect after hardware restart
@@ -881,7 +879,6 @@ struct ieee80211_if_mesh {
  */
 enum ieee80211_sub_if_data_flags {
 	IEEE80211_SDATA_ALLMULTI		= BIT(0),
-	IEEE80211_SDATA_DONT_BRIDGE_PACKETS	= BIT(3),
 	IEEE80211_SDATA_DISCONNECT_RESUME	= BIT(4),
 	IEEE80211_SDATA_IN_DRIVER		= BIT(5),
 	IEEE80211_SDATA_DISCONNECT_HW_RESTART	= BIT(6),
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index ecee9348c7..a36d0f64c6 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -2799,7 +2799,7 @@ ieee80211_deliver_skb(struct ieee80211_rx_data *rx)
 
 	if ((sdata->vif.type == NL80211_IFTYPE_AP ||
 	     sdata->vif.type == NL80211_IFTYPE_AP_VLAN) &&
-	    !(sdata->flags & IEEE80211_SDATA_DONT_BRIDGE_PACKETS) &&
+	    !(sdata->bss && sdata->bss->isolate) &&
 	    ehdr->h_proto != rx->sdata->control_port_protocol &&
 	    (sdata->vif.type != NL80211_IFTYPE_AP_VLAN || !sdata->u.vlan.sta)) {
 		if (is_multicast_ether_addr(ehdr->h_dest) &&
@@ -4826,7 +4826,7 @@ void ieee80211_check_fast_rx(struct sta_info *sta)
 		fastrx.expected_ds_bits = cpu_to_le16(IEEE80211_FCTL_TODS);
 
 		fastrx.internal_forward =
-			!(sdata->flags & IEEE80211_SDATA_DONT_BRIDGE_PACKETS) &&
+			!(sdata->bss && sdata->bss->isolate) &&
 			(sdata->vif.type != NL80211_IFTYPE_AP_VLAN ||
 			 !sdata->u.vlan.sta);
 
-- 
2.50.1

