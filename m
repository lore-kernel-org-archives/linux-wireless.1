Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530299;
	b=iaDR0BYPcXLahgFSZHkss9YY9KB9qwmG5R254TfO9UYIirjoMnKTTA1jOtBVhYv5AJ82
	 uU3pCpXTbg2HO8oE2PzJGygSY/kDS4sqHCuputZG32eIlEJz8NRHZ4b9qsQM3hDXB7Wk3
	 UagphAIQeFL7y9bp2oZi9HqwNzgHJ4bk2gGil7aqknwJeuipFWD9+NUoqlV6xPCOziW19
	 wdRsH2vBRVtW/DnSFGwXR3R7Qa2SS3Cqnl2nXOdydyufjvx/YCS/3EmvmbnqdXQu+p8ke
	 qZLfpPa64GySbbwe87Aj6I3eNg4tH4FifVTL04uLJgvdzbYUKgGfq1tnJbdTpWjnJdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=RCKrLkl5k99AJFpDDohI0CFzM+JQWzk+3RNc7Giamwc=;
	b=Xmganmz+oDt/LHLgqAkVKFXpUxJe2vJhPuFwUrgXFjci5lfAUfs0vEW95wCTAVh/yz7s
	 somFgU1Fuc6YqhmT/U9JVv9X9lGV2lkwWrJKCAhAMpQ5Cj+UMjP2GxFLnp+yFg2YGvyTz
	 V4bCD2RGXe1lkcZngSQgrV3hox0eEa9cqD/5Mx4j46UfS1YSVSYUTQSgooEWgIDWqofN2
	 2dRTrmvAfbTZdVzYhc+sp5TWdLCMUnuMhWRSluB4+DgEiXZVrAdsNFE5sfu1pLVXPHRd4
	 QZA0e+DYlQ/7inbR95vVbOoGJnpwk4vW0k99tkBTux8Ctj/mBbMdMDKkN2S397+w3TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=schenkerlabs.com;
	spf=pass smtp.mailfrom=schenkerlabs.com;
	dkim=pass header.d=schenkerlabs.com header.i=@schenkerlabs.com header.a=rsa-sha256 header.s=google header.b=uXWOPgZq;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562B5606A321
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 14:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 562B5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=schenkerlabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schenkerlabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=schenkerlabs.com header.i=@schenkerlabs.com header.a=rsa-sha256 header.s=google header.b=uXWOPgZq
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso44092505e9.3
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schenkerlabs.com; s=google; t=1795530298; x=1796135098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RCKrLkl5k99AJFpDDohI0CFzM+JQWzk+3RNc7Giamwc=;
        b=uXWOPgZqXDwIEN83d/T84ued3N5Br+vo3pUcq8iFupjM0jrveF2BKm3sqjAG2/jMcZ
         NYnE6pSRQxVpL8GXmZwCYA/IMLlWhW8poV0ygltRHm1hDdUOrxbcUumd1jBitkSpAVEj
         fv+AV4bZ07w3yxBOCL9nFkfa+xvNawYOLBJ2bupMliPZziqnopD519UN/5kUnOry9Bye
         y8GfbWA/cjgfdAI+m00VkmOXcBnfob/qGhPZzQ4YtxKKG/XyUxZ3gFYjnqvtWs21A/yM
         QwcCtYpk6Qbruq+cvsq9TbKcJL7VPnuO20juCmBZGVDAONfv2JQNAPL7p9ajBmpGgLye
         dZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530298; x=1796135098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RCKrLkl5k99AJFpDDohI0CFzM+JQWzk+3RNc7Giamwc=;
        b=WUaOEM4k6zL3ovsAiKkJXr05u9A30WWp5mpruFuqHvucaWK6pM9AeJa5XFX4RwMje6
         NZU4WrgIxBGRivJn1uA6oDTIOmDkKPi5fmGNGDPS2kRAguwtM2T53b/9Xg9BtjvmoXXN
         M8bIOQJgRz6LP8VPiItvR7IvKN46JSuxKPZcPycV5wX8oQFuo9Ftelt3U8MnZFm/CR5j
         wKSnPvaYmCQpwJosqUrfcREj06duDjWW0rvZCA7HFXfN+wH01zcAWtHucnQ+dCUrO3tx
         nYDOYvNm7lVS01e7tzjX1pb8iG0ZYhKLqv6xYc136+orPgKHAZqWFO+FjX7332N5TyrJ
         2cPQ==
X-Gm-Message-State: APuU4Z9Ak6vgcvntY+MR1uxPdPFCFE18j9ql/ivxGe83y4StU0XY0Ctn
	6fBkD9dcJICPxfRfY8++IbIr0vdwaz6c/GMzeZoiCNwn2lUt4sTa5ttR/VSbky/+VgEs
X-Gm-Gg: AZFdTZevMZbjgLOptNgbe7kLK6sHKyPFjXYaLO348T4wCUrRVUG9mS/N9SbzfL21f9K
	2ZjWvmy2u90iJ8vg6Sfx5wl0luCpq+2jwy+/OyjFjXhIMrAXMfrPEmsT61jgGgWcdCAzKDw6rw9
	reeZJKLcfsQNBYBFOyZAfQ78M+DWf5/Fm9AHrxAZ8mKwWmf908Ex/mUDGrKk4i6PyIn9afzeY87
	BCDTuC2YSHfgQoy62qQy+IGFTiRN/tBW14iGw3a+C4MKlo1a5zus80qeTDPxatSfHCSevjsPO7y
	ol1bOxorzkCgvKAOompbrsMPjVUehFHE0dDco6v3m+BWVL7dO2urLg7O1fQW3MyYYd24qkXcuh3
	upUSCXjjJkie+S4AOKQUoCJAvrpi9B4Mdrdsk1Y0B8m3fVhhCHss3Mh+SZuCsOe8B+r8cTjptfe
	cMq9d+cVyJ3/KWHmnO6AEpm03vRuPqBgqv7Yg0VuOSfC4iYMzt5HP+gNVLhje7YsyIwcQD9V6Td
	ONlKEBNnupeG0rgo03P84dDBirB/aIni2flg74gWGkX4a90S6eda4jmds8SreNgb6LPixKmu6TZ
	02S9v7I/NeAGiQZahfSkbfA8+C2CbK814qqMM6fogW+ObgekWSdYFkoKw3HN7ZewarEFCA==
X-Received: by 2002:a05:600c:1d8c:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4bb88820436mr306545315e9.35.1795530297416;
        Tue, 24 Nov 2026 06:24:57 -0800 (PST)
Received: from jbs-XPS-13-9310.sus.lan ([83.144.243.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm386718825e9.1.2026.11.24.06.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:24:56 -0800 (PST)
From: "Joerg Schenker (Schenker Labs)" <joerg@schenkerlabs.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath11k: clamp survey noise floor on QCA6390
Date: Tue, 24 Nov 2026 15:24:38 +0100
Message-ID: <20261124142438.106847-1-joerg@schenkerlabs.com>
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

QCA6390 firmware reports channel noise floor values of -111 to -118 dBm
in the chan info and pdev bss chan info events. The driver passes them
unchanged to cfg80211 as the survey noise floor.

These values don't match the signal levels reported by the driver. For
management frames, ath11k_mgmt_rx_event() calculates the signal level as
rx_ev.snr + ATH11K_DEFAULT_NOISE_FLOOR (-95 dBm). User space calculates
the SNR of a scan result as signal level minus survey noise floor, so
with a noise floor of -116 dBm, the SNR is 21 dB higher than the SNR
reported by the firmware.

The values are also far below the real noise floor. On an AP received
at -88 dBm, the AP transmitted to the station at 6.5 Mbit/s (MCS 0), and
the station transmitted at 13 to 27 Mbit/s. A noise floor of -116 dBm
would mean an SNR of about 28 dB, which allows much higher rates.

wpa_supplicant uses the SNR to calculate the estimated throughput of
scan results, and roams within an ESS when another BSS has a higher
estimated throughput. In an ESS with many APs, the station repeatedly
roamed from an AP at -60 dBm to an AP at -90 dBm:

  Current BSS:  ... freq=5580 level=-59 snr=57 est_throughput=180001
  Selected BSS: ... freq=5180 level=-90 snr=26 est_throughput=263301
  Allow reassociation - selected BSS has better estimated throughput

The station roamed to that AP twice within 15 minutes. After the first
roam, the connection was lost after about 100 seconds because of beacon
loss.

Add a hw_params flag to clamp the survey noise floor to
ATH11K_DEFAULT_NOISE_FLOOR, and enable it for QCA6390. The noise floor
is still reported, so users that require it, such as hostapd ACS, keep
working. Other chips are not changed.

With this change, the distant AP, received at -88 to -90 dBm, gets an
SNR of 5 to 7 dB and an estimated throughput of 18 to 26 Mbit/s instead
of 263 Mbit/s. In a one hour test at the same desk, the station stayed
on an AP at about -68 dBm the whole time, with 0.2% ping loss. Directly
afterwards, with the unpatched driver, the station connected to the
distant AP at -89 dBm, with 53% ping loss, and the test had to be
stopped after three minutes.

The problem was analyzed and this patch was developed with the help of
an AI coding assistant (Claude Code, model claude-opus-5-5). The
assistant analyzed the debug logs and the driver code, and wrote the
code and this commit message. I reviewed the change and tested it on my
laptop as described above.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1

Fixes: 9de2ad43d46c ("ath11k: add hw_params entry for QCA6390")
Signed-off-by: Joerg Schenker (Schenker Labs) <joerg@schenkerlabs.com>
---
Notes:

- Only QCA6390 is changed because it is the only chip I could test. I
  don't know whether other chips (e.g. WCN6855) report similar values.
  If they do, the flag can be enabled for them, or the clamp could be
  made unconditional.

- The noise floor is clamped instead of not reported, because hostapd
  ACS ignores surveys without a noise floor (acs_survey_is_sufficient()).

- ATH11K_DEFAULT_NOISE_FLOOR is used as the limit because it is the
  noise floor that the driver already assumes for the signal level of
  management frames. It also matches the link rates observed above.

- The survey noise floor has been reported unchanged since the initial
  driver commit d5c65159f289, which supported only IPQ8074. The Fixes
  tag points to the commit that added QCA6390, because the problem was
  observed there and the change only affects QCA6390.

- I don't know what the chan info noise_floor value refers to in the
  firmware. If there is a known conversion to dBm, using it would be
  better than clamping.

- AI assistance: I asked the assistant to find out why my laptop's WiFi
  was unreliable in one office while it worked elsewhere. It collected
  and analyzed wpa_supplicant/NetworkManager debug logs and per-second
  link measurements, found the cause in the driver, and wrote the patch.
  Over several iterations we changed the approach: from not reporting
  the noise floor (would break hostapd ACS), to a generic clamp (would
  affect chips I can't test), to this QCA6390-only clamp.

 drivers/net/wireless/ath/ath11k/core.c |  1 +
 drivers/net/wireless/ath/ath11k/hw.h   |  1 +
 drivers/net/wireless/ath/ath11k/wmi.c  | 20 ++++++++++++++++++--
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 766ae2730..8ffdd0a8f 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -306,6 +306,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.cfr_support = false,
 		.cfr_num_stream_bufs = 0,
 		.cfr_stream_buf_size = 0,
+		.clamp_survey_noise_floor = true,
 	},
 	{
 		.name = "qcn9074 hw1.0",
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 4996536fb..ea66f26b7 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -231,6 +231,7 @@ struct ath11k_hw_params {
 	bool cfr_support;
 	u32 cfr_num_stream_bufs;
 	u32 cfr_stream_buf_size;
+	bool clamp_survey_noise_floor;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 82f85df48..5db4ff346 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -7970,6 +7970,22 @@ static void ath11k_roam_event(struct ath11k_base *ab, struct sk_buff *skb)
 	rcu_read_unlock();
 }
 
+/* The firmware of some chips reports channel noise floor values far below
+ * the actual noise floor, e.g. -111 to -118 dBm on QCA6390. Signal levels
+ * of received management frames are calculated as rx_ev.snr +
+ * ATH11K_DEFAULT_NOISE_FLOOR in ath11k_mgmt_rx_event(), so user space
+ * calculates a far too high SNR for scan results from such a noise floor.
+ * On these chips, don't report noise floor values below
+ * ATH11K_DEFAULT_NOISE_FLOOR.
+ */
+static s8 ath11k_wmi_survey_noise_floor(struct ath11k_base *ab, s32 noise_floor)
+{
+	if (ab->hw_params.clamp_survey_noise_floor)
+		return max_t(s32, noise_floor, ATH11K_DEFAULT_NOISE_FLOOR);
+
+	return noise_floor;
+}
+
 static void ath11k_chan_info_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_chan_info_event ch_info_ev = {};
@@ -8032,7 +8048,7 @@ static void ath11k_chan_info_event(struct ath11k_base *ab, struct sk_buff *skb)
 	if (ch_info_ev.cmd_flags == WMI_CHAN_INFO_START_RESP) {
 		survey = &ar->survey[idx];
 		memset(survey, 0, sizeof(*survey));
-		survey->noise = ch_info_ev.noise_floor;
+		survey->noise = ath11k_wmi_survey_noise_floor(ab, ch_info_ev.noise_floor);
 		survey->filled = SURVEY_INFO_NOISE_DBM | SURVEY_INFO_TIME |
 				 SURVEY_INFO_TIME_BUSY;
 		survey->time = div_u64(ch_info_ev.cycle_count, cc_freq_hz);
@@ -8099,7 +8115,7 @@ ath11k_pdev_bss_chan_info_event(struct ath11k_base *ab, struct sk_buff *skb)
 
 	survey = &ar->survey[idx];
 
-	survey->noise     = bss_ch_info_ev.noise_floor;
+	survey->noise     = ath11k_wmi_survey_noise_floor(ab, bss_ch_info_ev.noise_floor);
 	survey->time      = div_u64(total, cc_freq_hz);
 	survey->time_busy = div_u64(busy, cc_freq_hz);
 	survey->time_rx   = div_u64(rx_bss, cc_freq_hz);
-- 
2.53.0

