Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122385;
	b=4VPX4WGoVXbvH1LdZnvUior7gJrBqbVGkmVPE4gEd/KXMUx/lGlhmJDaDNrH6IBwZWkk
	 Ja4/rjSecl683qyA3bRna41VFshAu+LEXa85a5REVo921/LDaUecHMclFwSuneohNrSmy
	 dicyOTfMjp20Lt2ugTQ3c3DZSz5Nn5KQ8eYoHynzOiZ0tGzxZlZ3w6KRk3kt+fnpQ11nM
	 d8dqJ5/o/A+hr3BWPu+6ktaZptJYIvaqvKfi3BkZlyzt9+GyjOPJFyhBHusx4ujr8nn1k
	 WSWD3JmxI86oF9cM2878Z0731bt+7ixJzazGoe+Iy07EpFGwVGiTqihs7DOwSkizFmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kq/pBnPAAVkr3tVitWJ2EsieKSmgkTn09+Ghh1ZSyG0=;
	b=yJXADXJf5xJyTUe6npcumGUyr2m/g95f3bFB2IQbzFpFror3kWr1zy7p91pgIp8hHyhq
	 M1NE6gCObhqWfa795O4wAO9TrNU4GKmtULV+zb6uwl1DJsBakK08C3OSUlFvW9Mi0Q9y1
	 2P8BRxb02sXI7DcjhCwdSyzDYODIdqITJ+DtszdXVEl2zH7oKtewwwN1CS0W7mI07wydE
	 F+yjOXkGyXDefQPoBnzVljsv2IekoEWhJg4r/EVArcn+UNkrRvZKPacPmtYsaAHNrhHg2
	 YzNQjZtKzJ1oSAKziP4vb5TY/wybQIgmICiv49ykYBRQu2sFHi424Z7/KhJtQUrYaGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ilcHyeDb;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F7E606A320
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 07:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8F7E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ilcHyeDb
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36ff9c9da34so417594eec.1
        for <linux-wireless@vger.kernel.org>; Sat, 07 Nov 2026 23:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794122384; x=1794727184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kq/pBnPAAVkr3tVitWJ2EsieKSmgkTn09+Ghh1ZSyG0=;
        b=ilcHyeDb2oKKezCDlr/ryC1sRYPUV1ih1gYlXKertPlPpogoF1zU2HW3eUvbteIufZ
         BZNuWV8YCNwzonlg81F3eHb/428n1GraRRP+3/1ptDW65bkUCstnxW5q3h4YEiqFbRBO
         bekuJq9QpOG4aoZzDDVSV5pLw8RyjgWv/xwu0p7NcH0teyRhMT0CYQ4qPT6pGnx3Xz7d
         Sj+LRTgxCSZ8huiflqVFNs57yfMAmIR+QfZvzruRi5FuSTsWf/nQe9w9RIAoqU3Hmx0l
         nUraWIIdfIe7ZdU/gwznZ6SOUU5dD49kpkDta0rGUZDpVC5qwoOQx63Bw5Y8YTMpgSSn
         UVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122384; x=1794727184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kq/pBnPAAVkr3tVitWJ2EsieKSmgkTn09+Ghh1ZSyG0=;
        b=K0+AfGW/F6Nya2Vms3If0RpU/iF4VsNh0YlKBbmaGTjqJogu0hxZYQL9HYwqDEHoLl
         WvliSd4QQUJSMaSQ9mc6DOTi5EInl8IbsXCGE7KKEMAS0DWMQmsdk9DBBRx4R5JJjPkD
         kt+Ng/qkedrhJ1yJ29vwRx5wO4u4RddnZErZdTLqZWSVJbceStNsotis6qfoxsYgeH3U
         pei/dc+K47uqAsd++Br0K19aturhTmsKI+sng+Olwfn85YzAwqk3UP7VjxQN1dDUeoqn
         RT8NJ/kDqw4DF6msnjjcUJWLbzRbs07vRVAiW1kEBDrAgQb/+GUWyc2yZ4ePEnjI7TIu
         BbOQ==
X-Gm-Message-State: APuU4Z+pNxJtzYR3YOOBPLmBqtPT3xlMCnGAlWzdIIEW0/JOkWAMwp3V
	Eu/T/Hh4MahHc11QmzXwHmwfxW4l+MplrbKefvoKl1SEpJIiBUr+oNcEx5cSsmu75BU=
X-Gm-Gg: AYBFou01R1lkKbq3oA55Eld6k/fPPDL7Vp8tC9jeSWL9CCH3TaTaAnXPsLb8m/bW3uC
	qAhATswHtiBlZQ8mQdObs3MHAIa3gWEtk2sK8W6W9JBDLxCK8BX/mGjgBBUimgLGx4mUVnMti4x
	09O+zPG+BfvooeinzYFOu0lWPhnImbggNKR3Lv3voqEFr5sWe4pDGgG8DvnQeHFOsi53tfqpmrF
	NnAKeppMHv6Yp613xBDGMUMY5XHJ+8zqTa5c/vI8bcLI0Z5Uhdl5JiGBDUWBGcdKNMIu41/ogDa
	/o9OercHxjHNknFxwdzSsnmt+TqdwqKmaj0jQOKqUUFCuCgVYAYiXFMHgyfVFUErl3yBSn1mdR+
	c6nMaovqfJ+zB+pQHsVvZDgJY/dY8ZcF8qmQ67pVhxO+awvK94pnihyNtcteoYgcdiKf4op3dUI
	RKz7IFS6U6+9Vt2YfAjBVG0RiblHHxxSYKnW73+P48wG+p9CYmKwhuzGJ3I+JIKKzvYnL8Wr6c2
	ljT+/x3EByaCvKXutR9o1P6/M2Te6Hm8Iiyb8tI+HFixjX0/Zl+rmaO8Ams4Upi4wS4/H37n2Oh
	gfZV9ZzwzFpSf9tjQ+SRSyG2MgebUWOK25AAPKrtLAz69/M=
X-Received: by 2002:a05:701b:20ce:10b0:1b2:3b5b:b80b with SMTP id a92af1059eb24-1b39fe87af9mr1150003c88.8.1794122383860;
        Sat, 07 Nov 2026 23:19:43 -0800 (PST)
Received: from cachyos-x8664.nitc.ac.in ([61.1.180.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm4207262c88.5.2026.11.07.23.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:19:43 -0800 (PST)
From: John Robin <johnrobin044@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: kuba@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	John Robin <johnrobin044@gmail.com>
Subject: [PATCH v2 2/4] wifi: mt7601u: enable AP and Wi-Fi Direct interface modes
Date: Sun,  8 Nov 2026 12:47:44 +0530
Message-ID: <20261108071820.35303-3-johnrobin044@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108071820.35303-1-johnrobin044@gmail.com>
References: <7ededd2f-98d0-41ac-91b4-2977963c4637@gmail.com>
 <20261108071820.35303-1-johnrobin044@gmail.com>
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

Register the AP, P2P_GO, P2P_CLIENT, and ADHOC interface modes in
mac80211 to allow for concurrent Station and AP operation. This
defines an interface combination supporting up to 2 concurrent modes
and sets NEEDS_UNIQUE_STA_ADDR so mac80211 can automatically generate
MAC addresses for the virtual interfaces.

Signed-off-by: John Robin <johnrobin044@gmail.com>
---
 drivers/net/wireless/mediatek/mt7601u/init.c | 31 ++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/init.c b/drivers/net/wireless/mediatek/mt7601u/init.c
index 5d9e952b29664..e871f7b63cb35 100644
--- a/drivers/net/wireless/mediatek/mt7601u/init.c
+++ b/drivers/net/wireless/mediatek/mt7601u/init.c
@@ -12,6 +12,25 @@
 
 #include "initvals.h"
 
+static const struct ieee80211_iface_limit if_limits[] = {
+	{ .max = 1, .types = BIT(NL80211_IFTYPE_ADHOC) },
+	{ .max = 8,
+	  .types = BIT(NL80211_IFTYPE_STATION) |
+#ifdef CONFIG_MAC80211_MESH
+		   BIT(NL80211_IFTYPE_MESH_POINT) |
+#endif
+		   BIT(NL80211_IFTYPE_P2P_CLIENT) | BIT(NL80211_IFTYPE_P2P_GO) |
+		   BIT(NL80211_IFTYPE_AP) },
+};
+
+static const struct ieee80211_iface_combination if_comb[] = { {
+	.limits = if_limits,
+	.n_limits = ARRAY_SIZE(if_limits),
+	.max_interfaces = 2,
+	.num_different_channels = 1,
+	.beacon_int_infra_match = true,
+} };
+
 static void
 mt7601u_set_wlan_state(struct mt7601u_dev *dev, u32 val, bool enable)
 {
@@ -599,6 +618,7 @@ int mt7601u_register_device(struct mt7601u_dev *dev)
 	ieee80211_hw_set(hw, AMPDU_AGGREGATION);
 	ieee80211_hw_set(hw, SUPPORTS_RC_TABLE);
 	ieee80211_hw_set(hw, MFP_CAPABLE);
+	ieee80211_hw_set(hw, NEEDS_UNIQUE_STA_ADDR);
 	hw->max_rates = 1;
 	hw->max_report_rates = 7;
 	hw->max_rate_tries = 1;
@@ -607,9 +627,16 @@ int mt7601u_register_device(struct mt7601u_dev *dev)
 	hw->vif_data_size = sizeof(struct mt76_vif);
 
 	SET_IEEE80211_PERM_ADDR(hw, dev->macaddr);
-
+	wiphy->interface_modes =
+		BIT(NL80211_IFTYPE_STATION) | BIT(NL80211_IFTYPE_AP) |
+#ifdef CONFIG_MAC80211_MESH
+		BIT(NL80211_IFTYPE_MESH_POINT) |
+#endif
+		BIT(NL80211_IFTYPE_P2P_CLIENT) | BIT(NL80211_IFTYPE_P2P_GO) |
+		BIT(NL80211_IFTYPE_ADHOC);
+	wiphy->iface_combinations = if_comb;
+	wiphy->n_iface_combinations = ARRAY_SIZE(if_comb);
 	wiphy->features |= NL80211_FEATURE_ACTIVE_MONITOR;
-	wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION);
 	wiphy->flags |= WIPHY_FLAG_SUPPORTS_TDLS;
 
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
-- 
2.56.0

