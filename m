Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084197;
	b=UgV1ng9pr9b9hnR7Hx8T3J6K2WhJ/XuHmzMf8+nPCag1T0Ru4mpr2rxddxrbP+v4ZzS6
	 E14OcmNzxQt4PAeM0HN4RLV/FkRpTGuRPhq5WrZ52QoS5AAJfjDyEtPZZBPSA65CPUNk6
	 pvtrXytczUOMJrr0n2lGs31uPAER8iLzTfIc1nXcgkbUvuPmbySRE/9lJectaaSd7nho7
	 gnS+7XXdf0WT5LayTfACdf7WJKIqcmYwKVkLR6lZmKl5hL8RIiYcHRVSXgjODRaZSduS3
	 5DK3kIAsp7haZ7Ou2zCPts+uZs6QTNOrEOD8UwCQrqd3xIjKueZ3o+s9De/lBt8ugkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kuGZFbYcrQiePHP3Byq306XzQsS1O3mWfsSV3fw9Ks4=;
	b=D6vwMufrt/9gs0ATI9MEz+ikgovvfSsbXR+PaCrGRLIMi2AhxbznJokPs5e/Cs8zdhzo
	 WXTedlRTP+7SXLZ9edM/e581Vqe+UbrOMmfavXPFVjGpUMUHP0fGiN7RyorRqSI1KIOxR
	 8ebHaWnGgPf28FQsiJyP38gPXbjavRE/DL7r7iijqEjc7+7vwbQtG2RKQVZxd9KjivaJF
	 nNrUKRPrJ/f8MG0FHg49iP4LYtXIhFOPOL7+PWmjZ86HhBxh++hd6tbS6py6RLvnDl7Dq
	 LfS/ZYv11SHqeKhVl1lnbgeCwtEktMDdMqwEzljCI2PV4E061+/cikAn4CJfTUWhbbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MAlw5oqF;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407F7606A324
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 10:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 407F7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MAlw5oqF
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso960896f8f.2
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 02:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084196; x=1795688996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kuGZFbYcrQiePHP3Byq306XzQsS1O3mWfsSV3fw9Ks4=;
        b=MAlw5oqFx+or4a59AXAcjexZmcXDGTmGdGMRnfYU6EuKAc/9/mWhE6/AmuJFQLegM+
         PFgGUMczz0LTRaDsR2i7Pt0+iVpXNSDGW1usdr5Sv3opmvg4qtjx63YY7EGltkx4GkbD
         v6H3FFjNydmkH3fJzKmFL240rdEPgr5i+llI8nZWoltP77i35Zb4lcSfjtGQIfE9GCb/
         os0feNQqLn6C9+ChCp0MZfLZnYmWtfKLFXA1wb06orqcEq8SXyogaGVR6RubKuVtpI5K
         fXlPO5cH3a6R1c1wM+wvY2+fc2/Aid74waZGIsL9YJxbQXSNEVT53MiPG3Wk1otBYdn+
         OqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084196; x=1795688996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kuGZFbYcrQiePHP3Byq306XzQsS1O3mWfsSV3fw9Ks4=;
        b=VrJmegVDjdZslL+ZmIHzJQu475pMIyRaMlHcQObhnFzd03LZiC8hm5emjNITDIslG0
         6IfNlHRVsDskox0YJ+d3qf9JIn3mMp01XripcXfZLvMRStnfk41qO3mga/GaQO4xzw5H
         eYK52FhKWYhuzLaBnP90Qy8CP7XdBm059EUBSs76LW4B9XELi+gQxXaf4mFqxh6wB6AJ
         cPhClIdKbZ8cSxUVQ0zeWYiYE8yp1uY4Luxh0rIjdHFvhheZDTcbA8vywzFFWjLCzoGv
         D54Z6CziL1qrzkJthEncl4YedohzJyHO8Id0LSqEB1dSeBs5WxFgTaQ7m7ZS8HG9g7cY
         Xbuw==
X-Forwarded-Encrypted: i=1; AL+hErFWZGVmrGws6l7JYvlOHoxFKONg1kjJS4MEq5Cq2al6nrHMCT4VZMMz21z3/WhhmB8btQIfuuI0UOjq/0Fslw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/fVu69EGjGbFR9DThY2ywbOJI9CfyhPCE5UzYlc1gy/lshdGi6
	a9tlTMJ13hS9LHHrMb4UBC1LAmyqoegPqOhRHnoa4lLcU4f42OyJ3SNX
X-Gm-Gg: AZFdTZeyCVM/9x6GZKvziYb8LnEyeYknren9qQEN3QNxFZwQ8yp5hzAZ8eLJBsB+ihq
	2PPEUkKQqwo3WM22ZDVUimZ6Ev/OAm8gytr9FLqLwLaCI1dHbNbu9QpzfCgU9JE5vKYZxJv9iYf
	JD2MIxQjFbVmEOXr/RpwKlVBauonoGvATN16lbN0IPFRNI8+gvrlhwXg3WHmeCjK1MxJWY8Xx0y
	o/3WI8+lb7U79SOLoLo4dkYVehNPbq5ZeQOBwzJvmu+Rmwh8xa0i8SjQP3zIH1OhiyxjcWjnbz3
	aM7Lqx2mAdOj+TluAMwIqiMYGV80UClk02yYJ9jSN8ZOsIXcsQzi+lhL13QkRdBcrnS3xL+43w+
	ES08XCaHJOvPNfJRC2/yyuppHZcfJKVcYe4qnnLqVZ98efyT8bToHkspw+SPOxPfGoqPwHwBopw
	pby+dYurI/DwOVI+maWl6VIl/GxLgizvdneKdR6zPmh7hO6SmsIzhVRqCbEwM+GfH/7Ih/rXprW
	E7Y7ONoiVCNyLinO4aw1z63o7j5mjY1fGdF9/vYUmTCUzhDeOhil3WfPoCvEkionu2qFa6KEbq/
	mo1CESlnSnhOg80GxEZdWa1dUY2pDZ1+Ntk=
X-Received: by 2002:a05:6000:29c8:b0:491:6c24:65f5 with SMTP id ffacd0b85a97d-4a63984b729mr7019640f8f.17.1795084195565;
        Thu, 19 Nov 2026 02:29:55 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560882asm10354674f8f.27.2026.11.19.02.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:29:54 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH RFC rtw-next] wifi: rtw88: raise the TBTT hold time while beaconing
Date: Thu, 19 Nov 2026 11:29:53 +0100
Message-ID: <20261119102953.4035731-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

rtw88 sets the hold time of REG_TBTT_PROHIBIT once at chip init, to
0x64 * 32 us = 3.2 ms, and keeps it while beaconing. A beacon that
cannot start within the hold time after TBTT is not sent: on the air
no beacon came later than 3.2 ms after its TBTT. On 2.4 GHz channel 6
a neighbour multi-BSS AP sends three beacons back to back, about 7.5 ms
of air time. Each time its beacon period drifts across our TBTT, every
~157 s here, an RTL8822BU AP sends only 0-2 of 10 beacons per second
for about 7 s.

The other Realtek drivers use a longer hold time while beaconing and
write the init value back when beaconing stops: the vendor driver and
rtl8xxxu 0x80 (4.1 ms), rtlwifi 0x1ff (16.4 ms). rtw8703b and rtw8723d
define 0x80 for this but never use it.

Set the hold time to 0xff (8.2 ms) when beaconing starts and back to
0x64 when it stops, which also covers the off-channel periods in which
mac80211 stops the beacon. In 330 s on channel 6 the RTL8822BU AP had
14 seconds with fewer than 6 of 10 beacons with 0x64 and none with
0xff; its beacons then went out up to 8.1 ms after TBTT.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
RFC because I would like your view on the hardware before this goes
further:

1. The captures suggest the MAC drops a beacon that cannot start
   within the hold time. Is that how it works, and does a longer hold
   time delay any other TX? iperf3 and ping through the AP were the
   same with 0x064, 0x0ff and 0x400.
2. Which value do you recommend while beaconing: a fixed one, or one
   derived from the beacon interval? With 0x0ff an RTL8821CU, a second
   RTL8821CU and an RTL8822CU had no such seconds either, but an
   RTL8822CE still had 6: its beacons were cut off at 8.2 ms.
3. The CSA series [1] downloads each countdown beacon 10 ms after TBTT,
   so a hold time above about 9 ms needs a later download there. If
   the reserved page is rewritten while a beacon still waits in the
   hold window, which beacon goes out, the old or the new one?

With [1] and 0x0ff, an RTL8822BU AP with a station made 128 countdowns
of 5; the two that met the neighbour's beacons kept every count on the
air, count beacons up to 5.0 ms late. Without this patch the one that
did lost counts 2 and 1.

Tested on rtw-next with RTL8822BU, RTL8821CU and RTL8822CU (USB) and
RTL8822CE (PCIe) as AP, lockdep on.

[1] https://lore.kernel.org/linux-wireless/20261118231940.3950-1-mehmet.fide@gmail.com/

 drivers/net/wireless/realtek/rtw88/mac80211.c | 11 +++++++++--
 drivers/net/wireless/realtek/rtw88/reg.h      |  3 +++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 3029fbdb288a..cb1deeffef71 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -449,12 +449,19 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 	}
 
 	if (changed & BSS_CHANGED_BEACON_ENABLED) {
-		if (conf->enable_beacon)
+		if (conf->enable_beacon) {
 			rtw_write32_set(rtwdev, REG_FWHW_TXQ_CTRL,
 					BIT_EN_BCNQ_DL);
-		else
+			rtw_write32_mask(rtwdev, REG_TBTT_PROHIBIT,
+					 BIT_MASK_TBTT_HOLD_TIME_AP,
+					 TBTT_HOLD_TIME_BCN);
+		} else {
 			rtw_write32_clr(rtwdev, REG_FWHW_TXQ_CTRL,
 					BIT_EN_BCNQ_DL);
+			rtw_write32_mask(rtwdev, REG_TBTT_PROHIBIT,
+					 BIT_MASK_TBTT_HOLD_TIME_AP,
+					 TBTT_HOLD_TIME_STOP_BCN);
+		}
 	}
 	if (changed & BSS_CHANGED_CQM)
 		rtw_fw_beacon_filter_config(rtwdev, true, vif);
diff --git a/drivers/net/wireless/realtek/rtw88/reg.h b/drivers/net/wireless/realtek/rtw88/reg.h
index 877b82640e91..86cbe4e96b24 100644
--- a/drivers/net/wireless/realtek/rtw88/reg.h
+++ b/drivers/net/wireless/realtek/rtw88/reg.h
@@ -491,6 +491,9 @@
 #define BIT_DIS_STBC_CFE	BIT(8)
 #define REG_TBTT_PROHIBIT	0x0540
 #define BIT_SHIFT_TBTT_HOLD_TIME_AP 8
+#define BIT_MASK_TBTT_HOLD_TIME_AP GENMASK(19, 8)
+#define TBTT_HOLD_TIME_STOP_BCN	0x064
+#define TBTT_HOLD_TIME_BCN	0x0ff
 #define REG_RD_NAV_NXT		0x0544
 #define REG_NAV_PROT_LEN	0x0546
 #define REG_BCN_CTRL		0x0550

base-commit: 0bdc579dbfc251a6b6838ee9459b6771b948c617
-- 
2.56.0

