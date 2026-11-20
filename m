Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218847;
	b=UzVnw+1mJpSuS/bEzOpy0zn3S9r+pg7t7szCbDEUBgBWhFQwa53wJq6mPhcNxTo0gI6K
	 Mrna2Jr5jKDKn467ku8ye/vfqvH1CeAIs5+rQV8mwFEJmC+gGoWOLEexG0pSuAUu8ZlRJ
	 PFhFYBdv3dq/6Akp0Z9oxsVNNXTG3Y3Fphhjry0+MdKMIi9iQiVmzZ5PcffNshiIsSviF
	 0HGENxK/WWbp3/zXGn57u+KxsCs+Gd/hFKi9Swvn9qju/yPvH1fgeTTfJ1qbt76SxM7Qo
	 eUZ/LtPW6O07a5gmazoBnAaY0/KGss7I8zu/ZFDXqzSOEuBZEFjW9dlCm6BK7zIJL4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=eiLcwTcZ1hbe/Tx4kijoNNSbhs8rhGh6UpplhbLUE4M=;
	b=r3erws5RMbNEEgyf7wOzz3+7rsXgxK6JyxQxx8zB/uq6shrP2g2sYFVpqPiR47SYB/gR
	 ORS/kt1ECOX3X3WbcV0yFEc7FJkC9nwD5jEp+QgqTypCNpyYjJVwff820jd1nKRJht0XM
	 JtogLIFjYkBETmKZ2blim6t1AdwZTDV8pMp51en8dBV/h/veCdVi95D82JTvevHKjfPs3
	 PwU4O8pJvGzESLVo2D2uMEa/XE2NgrHHqfApCEBGEiN07ohU3T6TakDxRhX5hxVtqZj5E
	 e/2gWh25LXgR88Yj/Um9QMFqdg0fsFGAROtVysvfum1D3cwSletpZe530GeRB62BnVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEfsBVK1;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A73606A6B7
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 23:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83A73606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEfsBVK1
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1271195f8f.2
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 15:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218841; x=1795823641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eiLcwTcZ1hbe/Tx4kijoNNSbhs8rhGh6UpplhbLUE4M=;
        b=YEfsBVK1hwceNBZQHEUek8yqwQXjUFU/IKysDtZY14YzjL+bKDELMibvNWy/Z+CijO
         vS4HpV9OcvZAmrbkPGkde/lyjn8kcyuM9tS5kc7qDYjwFsdBHEuWOnPmpViNlMksG88T
         sC3iaRd4hTsJOq6y13WF1vEB6GX+YSYU12j/o/m76HXmUetSPbuPP1HOOsY9ikWP0FAU
         ZCS8OB3dPeZqS5ORk6OFWOkP/OZlsn3V+wx+wEFRKiU3GL7eZ9pk+qnZ6ADl/9oi0hsT
         QKc/Vstn6ndfhx07/1wEOW9L68yqGZXy3/yQPmqKp7zQbDKLZ7BHMz78wVgkzHrw+vvr
         H74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218841; x=1795823641;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eiLcwTcZ1hbe/Tx4kijoNNSbhs8rhGh6UpplhbLUE4M=;
        b=nRmx2zZB4Yx3smhHQsKHMcSBgMbGE2ET1ZkiVRAmuk0A7hebvxgQaLWF1mfKYkQtv3
         Q3KqX4LC5xw5gadkhTMhA05NYnunD2jm5Y1BfL8NyU3PlwJWbYSe9WT2YnuSidY56pvG
         3vpQzc2D0KDFCiOjwiZ5BJC9vV6K1UXnMpB1YfhT0B2Gvc5TsWx2xp/8+KqRi485K+O3
         dehWKemts/Tika3lOWkYx4H+G51IttJz8xIojWDNi2J7Gk2OpDSO2XAxm3io0PjSSaCq
         nF9n+38b1hS6PSuJwQteqLbZ2RpH5bUaNUWOZ04HkyRel1rMTu+lJlYlo/pawUTOjqnW
         nfgg==
X-Forwarded-Encrypted: i=1; AL+hErFLM15R81/iAmh7t4fxwnM+8RjM6kqq/aNyR+nVF4TzWbS/QRQADbVh+DtEuE8Z707qTA8UaiBmqyZw0qgpgQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8aM7G9GKQ66/HqD+sATqnOVMRqwJP1mpub65xVi3I0XEtcwQNF
	QcZIvsnqQbQhDNF3nZqztuJG8OscqbDAqmEhqErG+7ptcDUZL1WcmBg0
X-Gm-Gg: AZFdTZfwUVbcfx7iBbytOA+y0cpZ3g3BYeMbb8QMJwJDcQ+NZGUCUzIf0L+oN+GE0Jy
	eg4aKjfyGhMzANVdONlz1gZUUBHo2eZh6/a9FXPTjQDQBT7DXhTIKy5PfJaGaX6lWoi4ijHexAl
	iBJrwj4kSDy99atf1PP16yO8Ae/EJ5mx9airIVZzJ41lDM2EDUPkH26etDX6cP897I6CYQTd2Hr
	wPevsw7uSNKOHyfW33vAwtPPFCASpQaG9JYnSc9yTPhoUEh6LldFiiNqoOXcbbyVLXgwHRBHfZy
	/LMDGgJ1k6nNBMlZkgepK0g5syq6rVej0ztiwNz/QEb7slkfbW9wfURFM2mDMsBUraF3VTeL0g4
	58tN8JlsYkF4zYV+VOlSQCrZLFYSwAx02CmrapUssL50H7cbhMNDWen62iu8hZCYLJotAi6bNql
	QQReVkdKwrsVCa/KUFfwcpe6AlK66zzDGQgWebyyhLsXmJSvUw5ALKJXsTGDaKAg6eAWCxj8mOW
	2LMhbSGMnQZD5fYf5CLizCeROcVZtSde0HHezwUUEHP4piW+L5218+r7dBFQMJ5JvTgBTA6W55F
	lqxfcdAAIOJgiFCiysEV3vGM7S7Wcnn1NFEflsOaCBP9jk9LvvbvbWsSlmTX1P8gxQ==
X-Received: by 2002:a05:6000:26ca:b0:492:3176:3d64 with SMTP id ffacd0b85a97d-4abad5ac748mr9298680f8f.8.1795218840700;
        Fri, 20 Nov 2026 15:54:00 -0800 (PST)
Received: from widimak.lan ([2a0a:8380:3:1200:4b4f:fa7c:a880:937d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm8057730f8f.41.2026.11.20.15.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:54:00 -0800 (PST)
From: =?UTF-8?q?Miroslav=20R=C3=BDzek?= <miroslav.ryzek@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Christopher Hill <ch6574@gmail.com>,
	linux-wireless@vger.kernel.org
Subject: [PATCH wireless RESEND] wifi: mac80211: apply ap_isolate to AP_VLAN stations
Date: Sat, 21 Nov 2026 00:53:59 +0100
Message-ID: <20261120235359.3424212-1-miroslav.ryzek@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Christopher Hill <ch6574@gmail.com>

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
Tested-by: Miroslav Rýzek <miroslav.ryzek@gmail.com>
Signed-off-by: Miroslav Rýzek <miroslav.ryzek@gmail.com>
---
Resent with Christopher's agreement: the original posting
https://lore.kernel.org/linux-wireless/20261107035220.50480-1-ch6574@gmail.com/
is not in patchwork, which has no linux-wireless patches from 7-9 Nov.

 net/mac80211/cfg.c         | 5 +----
 net/mac80211/ieee80211_i.h | 5 +----
 net/mac80211/rx.c          | 4 ++--
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 9608c07bc..cc9d2384d 100644
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
index 7a64aef68..e4cb757a4 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -344,6 +344,7 @@ struct ieee80211_if_ap {
 	atomic_t num_mcast_sta; /* number of stations receiving multicast */
 
 	bool multicast_to_unicast;
+	bool isolate;
 	bool active;
 };
 
@@ -874,9 +875,6 @@ struct ieee80211_if_mesh {
  * enum ieee80211_sub_if_data_flags - virtual interface flags
  *
  * @IEEE80211_SDATA_ALLMULTI: interface wants all multicast packets
- * @IEEE80211_SDATA_DONT_BRIDGE_PACKETS: bridge packets between
- *	associated stations and deliver multicast frames both
- *	back to wireless media and to the local net stack.
  * @IEEE80211_SDATA_DISCONNECT_RESUME: Disconnect after resume.
  * @IEEE80211_SDATA_IN_DRIVER: indicates interface was added to driver
  * @IEEE80211_SDATA_DISCONNECT_HW_RESTART: Disconnect after hardware restart
@@ -884,7 +882,6 @@ struct ieee80211_if_mesh {
  */
 enum ieee80211_sub_if_data_flags {
 	IEEE80211_SDATA_ALLMULTI		= BIT(0),
-	IEEE80211_SDATA_DONT_BRIDGE_PACKETS	= BIT(3),
 	IEEE80211_SDATA_DISCONNECT_RESUME	= BIT(4),
 	IEEE80211_SDATA_IN_DRIVER		= BIT(5),
 	IEEE80211_SDATA_DISCONNECT_HW_RESTART	= BIT(6),
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index f8cfd04c0..7afeb0b90 100644
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
@@ -4837,7 +4837,7 @@ void ieee80211_check_fast_rx(struct sta_info *sta)
 		fastrx.expected_ds_bits = cpu_to_le16(IEEE80211_FCTL_TODS);
 
 		fastrx.internal_forward =
-			!(sdata->flags & IEEE80211_SDATA_DONT_BRIDGE_PACKETS) &&
+			!(sdata->bss && sdata->bss->isolate) &&
 			(sdata->vif.type != NL80211_IFTYPE_AP_VLAN ||
 			 !sdata->u.vlan.sta);
 
-- 
2.56.1

