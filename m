Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794964079;
	b=ul4UKvMaoxUVIn7vy+ASlwc4VjxejPlhvkE/3BV1oqwzazejyI1PwMPfTSduXilKODUI
	 LtA+VgP3ZOkx39ZiuE4X9GnBo4Syf9eOCOBocIWkdHtPcdqYpSdT9BjMqQckDxK5Wi2Wz
	 YkPJlrwFzNKarJMLmJ11hDKS1DyQW4jYSQvDjwLwdyvor9u64kAnIBCH/xaVLt76L78+3
	 f+DbscsZSBk/nLhqXwe2d5kSgrQ1VEMr4rr9Zx4fnE5lfZanxbSnbbjDNIrCZYDom10kC
	 xmATlqBJBdnpxO+GES9shy9BAs5D1bEAaLg90kfCwn8Lz1zEeOlvadION8z6kSmWsHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794964079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LK3yJmmUtuIzXdaLVh77oxM+r8ZAUsxA4WTGoiDd8Es=;
	b=oviYhsvP2G9vftJc4MPRAQgvTR7ZlepWe/r8b5sq3E22CRZGBsKKDQqunYCvlBgi8Fjf
	 C77Ss4NanYOObnNS1hkAKMcZLPxfl2VHwbNY4qpPZg9s2rR8KpfcxVpgMEq6HM/sIk0z2
	 J2knMee7sElJqPr+CLXy3VcEELsjiJRmIPMuW4o+aMBTkCS2Fga3vvPmaOsPUDxU9uD+n
	 aUD6B5Q3wtomngDI+wbgpIezda+pM80hiZEEsq8IQX6WrtxYwTGkwrDnERIqCl7doXiWk
	 aJ611ufAGZhmF93/tF1d6ugfgjqY7LiXgYqgT3ZvnqNS9Qwulc7fxuexr/+GbPuE9eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JYBpdTjF;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6C6606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 01:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB6C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JYBpdTjF
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b3d4d3bba3so106904a91.3
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 17:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1794964078; x=1795568878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LK3yJmmUtuIzXdaLVh77oxM+r8ZAUsxA4WTGoiDd8Es=;
        b=JYBpdTjFNwP9V7QVKCT4h9tFMw4GwQNPsFUxiytXmZHA9IYMsTLNQumJe/vvVHQOD3
         DU0dGpn7Fz1nYFEXLCkJDvTphJ6+Tc9+vEO+amlfn4T3Sw8hBPn4ubAL5PEGisvYsHZK
         X84XlWYOlj+Kzf7Fqr1BjdtjeJ9S4qAPVGC7hRCAHIiZdbCotTlrge+9yu/tTkoWhukg
         BxBFEy7WI9gQ/rsZ+IA5/glcZ5mjvouW7JBUZfeggxM5ZJq4oHtWmYSvZ/xqQGrGQsgJ
         YPuJeGzJr5HKJmW7oHFX1aypWBc+51fxscdUqFQ374p+6ZZ7nglj6XT1igAo2x+1l4A3
         lw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794964078; x=1795568878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LK3yJmmUtuIzXdaLVh77oxM+r8ZAUsxA4WTGoiDd8Es=;
        b=mmknkm/MyQhm9L8QAkudhiMBy02koG5zpfnR3SjchKYl9nug1+7j5pLxV9+Gun6w3F
         PunLT2GLr8cMGF8HrF5IrWwpP1aFhLFCQcbtUMmQ0+Y11zbuWIcfimLTw67vEEpB3LT+
         QZ4g8pCW6GJn6hmgFqM9iPvBGLCa7np6LjyXcXf3wXkWi69a+rLH5ApPQCEtjzexBl9A
         g29EgT657oB/Jv+IFTqt5rIyTLFOJZTSPmdfWOYOzv7u7R4ufdJ42IU/RaMNChiDbh0e
         oSLhpS/1aqm0Zw0LOWgtzhZUUUISZl6ToNDvs/n2EZpXaS9gYIbB7id/3+GHwKZilVqx
         wRsQ==
X-Gm-Message-State: APuU4Z+rpKW1K8knU0YVJe+iYwRzs76EYIRVSakIr454+Cxmrk+0vF5f
	vN6sLucatCSoXRtBoKKdNL2WIJPTO+T8Z5XcuAfuQROwHSnPTo3u8C8l76B4BayzhdWuWhWdJDK
	K0fEye+8=
X-Gm-Gg: AZFdTZfn0+FQt5zjbFtQAtQOvCtDV0qZ0Rv59kDHF0xyMGpsrXyuS5hP0xpcuiHXHdN
	2ByW7nU3ketU0Yu27CWElpyYZeXL7jKnIt5+9t7k9cF39zxVSCjj8hpyhHLhwKUqwdyQGGwvwQr
	6gPnXl4a1jfktEGVyjdJssdnimU78sl+/ixsHI3zWMOd0d+7+4tcniIaEqcUP11maIXWW9yjAUj
	Wlzw1ueLBTLpTi1MJ7VTLJFSKXDtUEWwfuvKbtBqVDT+9UWinDuZO3dMUPpdfs67g3QNs9ZZ+/9
	W1rZOdD7c5IacU5UQ9/gMG4YLpA6QzftNPpmHlp/mw0rzMuvze8mIvZuOZ3CuIeidIxgc5e+rmH
	Z/2yJggVJLNLLWxjF3U0hRs4yzX9I2E/7l4Kr8qj96RIEND+xYT87a+WIfGzp7DWB5SlSbtb2vB
	BzzUH3Xcgj8E3jsnb1niyw9Kq25smCCFSo+iCUds5w6+dfOCVdp3jNAaNFpOu3ZGf+MG616N/71
	mJF+M9K3oYJyFtHqLWf9DIbwjJzBx/+M1aE8wi2IWI3YBU6TppbND8bBdZknAghZBFsfz+UkmrB
	x2yaQNGxoxMh/oaPgYk9aabhhfd+fNVONspssEuzKpzX0TGT8ommS6E8lZEAmnnWg4JS7OLVSST
	AH4BzL3MVouKOUNGYghr4KeNNW37iLLcehw==
X-Received: by 2002:a17:90b:3e4e:b0:3b3:a9d8:ed2b with SMTP id 98e67ed59e1d1-3b3d07a2082mr1093518a91.14.1794964077834;
        Tue, 17 Nov 2026 17:07:57 -0800 (PST)
Received: from mma-H9MHD44.lan (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2b5ec6sm6420780a91.10.2026.11.17.17.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:07:57 -0800 (PST)
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	arien.judge@morsemicro.com,
	samuele.yang@morsemicro.com,
	james.haggerty@morsemicro.com,
	Lachlan Hodges <lachlan.hodges@morsemicro.com>
Subject: [PATCH RESEND v2 2/4] iw: print S1G channels correctly
Date: Wed, 18 Nov 2026 12:07:36 +1100
Message-ID: <20261118010738.1353183-3-lachlan.hodges@morsemicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118010738.1353183-1-lachlan.hodges@morsemicro.com>
References: <20261118010738.1353183-1-lachlan.hodges@morsemicro.com>
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

S1G channels have a freq_offset component so when the attribute is
passed print it correctly. Also print whether the S1G 2MHz primary
flag is set.

root@MM_buildroot:~$ iw dev
phy#1
        Interface wlan0
                ifindex 4
                wdev 0x100000001
                addr 0c:bf:74:00:30:fd
                ssid wifi_halow
                type AP
                channel 43 (923.500 MHz), width: 8 MHz, center1: 924 MHz, pri_2mhz: 1
                txpower 19.00 dBm
                multicast TXQ:
                        qsz-byt qsz-pkt flows   drops   marks   overlmt hashcol tx-bytes  tx-packets
                        0       0       174     0       0       0       0       10760             174

Signed-off-by: Lachlan Hodges <lachlan.hodges@morsemicro.com>
---
 info.c      | 12 ++++++-----
 interface.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++------
 phy.c       | 12 +++++++++--
 3 files changed, 71 insertions(+), 14 deletions(-)

diff --git a/info.c b/info.c
index 1d123a23eb1c..ef4e23ae3316 100644
--- a/info.c
+++ b/info.c
@@ -483,7 +483,8 @@ static int print_phy_handler(struct nl_msg *msg, void *arg)
 					band_had_freq = true;
 				}
 				nla_for_each_nested(nl_freq, tb_band[NL80211_BAND_ATTR_FREQS], rem_freq) {
-					uint32_t freq;
+					uint32_t freq, freq_offset = 0;
+					int chan;
 
 					nla_parse(tb_freq, NL80211_FREQUENCY_ATTR_MAX, nla_data(nl_freq),
 						  nla_len(nl_freq), freq_policy);
@@ -491,15 +492,16 @@ static int print_phy_handler(struct nl_msg *msg, void *arg)
 						continue;
 					freq = nla_get_u32(tb_freq[NL80211_FREQUENCY_ATTR_FREQ]);
 					if (tb_freq[NL80211_FREQUENCY_ATTR_OFFSET]) {
-						uint32_t offset = nla_get_u32(
+						freq_offset = nla_get_u32(
 							tb_freq[NL80211_FREQUENCY_ATTR_OFFSET]);
-						printf("\t\t\t* %d.%d MHz", freq, offset);
+						printf("\t\t\t* %d.%d MHz", freq, freq_offset);
 					} else {
 						printf("\t\t\t* %d MHz", freq);
 					}
 
-					if (ieee80211_frequency_to_channel(freq))
-						printf(" [%d]", ieee80211_frequency_to_channel(freq));
+					chan = ieee80211_freq_khz_to_channel(MHZ_TO_KHZ(freq) + freq_offset);
+					if (chan)
+						printf(" [%d]", chan);
 
 					if (tb_freq[NL80211_FREQUENCY_ATTR_MAX_TX_POWER] &&
 					    !tb_freq[NL80211_FREQUENCY_ATTR_DISABLED])
diff --git a/interface.c b/interface.c
index a33d05194551..b641bf01baae 100644
--- a/interface.c
+++ b/interface.c
@@ -367,24 +367,71 @@ char *channel_width_name(enum nl80211_chan_width width)
 		return "10 MHz";
 	case NL80211_CHAN_WIDTH_320:
 		return "320 MHz";
+	case NL80211_CHAN_WIDTH_1:
+		return "1 MHz";
+	case NL80211_CHAN_WIDTH_2:
+		return "2 MHz";
+	case NL80211_CHAN_WIDTH_4:
+		return "4 MHz";
+	case NL80211_CHAN_WIDTH_8:
+		return "8 MHz";
+	case NL80211_CHAN_WIDTH_16:
+		return "16 MHz";
 	default:
 		return "unknown";
 	}
 }
 
+static bool is_s1g_width(enum nl80211_chan_width width)
+{
+	switch (width) {
+	case NL80211_CHAN_WIDTH_1:
+	case NL80211_CHAN_WIDTH_2:
+	case NL80211_CHAN_WIDTH_4:
+	case NL80211_CHAN_WIDTH_8:
+	case NL80211_CHAN_WIDTH_16:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static void print_channel(struct nlattr **tb)
 {
 	uint32_t freq = nla_get_u32(tb[NL80211_ATTR_WIPHY_FREQ]);
+	uint32_t freq_offset = 0;
+	int chan;
+
+	if (tb[NL80211_ATTR_WIPHY_FREQ_OFFSET])
+		freq_offset = nla_get_u32(tb[NL80211_ATTR_WIPHY_FREQ_OFFSET]);
 
-	printf("channel %d (%d MHz)",
-	       ieee80211_frequency_to_channel(freq), freq);
+	chan = ieee80211_freq_khz_to_channel(MHZ_TO_KHZ(freq) + freq_offset);
+
+	if (freq_offset)
+		printf("channel %d (%d.%03d MHz)", chan, freq, freq_offset);
+	else
+		printf("channel %d (%d MHz)", chan, freq);
 
 	if (tb[NL80211_ATTR_CHANNEL_WIDTH]) {
-		printf(", width: %s",
-			channel_width_name(nla_get_u32(tb[NL80211_ATTR_CHANNEL_WIDTH])));
-		if (tb[NL80211_ATTR_CENTER_FREQ1])
-			printf(", center1: %d MHz",
-				nla_get_u32(tb[NL80211_ATTR_CENTER_FREQ1]));
+		enum nl80211_chan_width width =
+			nla_get_u32(tb[NL80211_ATTR_CHANNEL_WIDTH]);
+
+		printf(", width: %s", channel_width_name(width));
+		if (tb[NL80211_ATTR_CENTER_FREQ1]) {
+			uint32_t cf1 = nla_get_u32(tb[NL80211_ATTR_CENTER_FREQ1]);
+			uint32_t cf1_offset = 0;
+
+			if (tb[NL80211_ATTR_CENTER_FREQ1_OFFSET])
+				cf1_offset = nla_get_u32(tb[NL80211_ATTR_CENTER_FREQ1_OFFSET]);
+
+			if (cf1_offset)
+				printf(", center1: %d.%03d MHz", cf1, cf1_offset);
+			else
+				printf(", center1: %d MHz", cf1);
+		}
+		if (is_s1g_width(width))
+			printf(", pri_2mhz: %d",
+			       !!tb[NL80211_ATTR_S1G_PRIMARY_2MHZ]);
 		if (tb[NL80211_ATTR_CENTER_FREQ2])
 			printf(", center2: %d MHz",
 				nla_get_u32(tb[NL80211_ATTR_CENTER_FREQ2]));
diff --git a/phy.c b/phy.c
index ab629c6b4eb3..84cd025a3d81 100644
--- a/phy.c
+++ b/phy.c
@@ -87,14 +87,22 @@ static int print_channels_handler(struct nl_msg *msg, void *arg)
 
 			if (tb_band[NL80211_BAND_ATTR_FREQS]) {
 				nla_for_each_nested(nl_freq, tb_band[NL80211_BAND_ATTR_FREQS], rem_freq) {
-					uint32_t freq;
+					uint32_t freq, freq_offset = 0;
+					int chan;
 
 					nla_parse(tb_freq, NL80211_FREQUENCY_ATTR_MAX, nla_data(nl_freq), nla_len(nl_freq), NULL);
 
 					if (!tb_freq[NL80211_FREQUENCY_ATTR_FREQ])
 						continue;
 					freq = nla_get_u32(tb_freq[NL80211_FREQUENCY_ATTR_FREQ]);
-					printf("\t* %d MHz [%d] ", freq, ieee80211_frequency_to_channel(freq));
+					if (tb_freq[NL80211_FREQUENCY_ATTR_OFFSET])
+						freq_offset = nla_get_u32(tb_freq[NL80211_FREQUENCY_ATTR_OFFSET]);
+
+					chan = ieee80211_freq_khz_to_channel(MHZ_TO_KHZ(freq) + freq_offset);
+					if (freq_offset)
+						printf("\t* %d.%03d MHz [%d] ", freq, freq_offset, chan);
+					else
+						printf("\t* %d MHz [%d] ", freq, chan);
 
 					if (tb_freq[NL80211_FREQUENCY_ATTR_DISABLED]) {
 						printf("(disabled)\n");
-- 
2.43.0

