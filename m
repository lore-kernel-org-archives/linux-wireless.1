Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462457;
	b=5sCbRPgmVGftGkYCx4/5Aq9dL6F30B9VhdroygM4iScFaEoaSmjBiGAQ+jHFOBh22MM1
	 0HZue4fKig6s2VWluewiIGYm4MzaswAmnDPrtzo461ITvGDeNhodEU5kMD8FKrMp0oP4k
	 DM5vvfV9UUN4fJi22ukwXpGduQrh2B51pzGwklsVA1+uw+TRwVMdZuXjxDJxlfcs+aIRm
	 H+armFzSD3nOi1T9R26aI1YalRJfEostxEz6tWZElzYFtb/hAD/8rEysulL5sTh1kaHwM
	 QY9aQZM2KjD5OyugX0OcGxVg1bzf1otHXbyhmxQTqlhqNKiD7X3DL14nioTK3k+1kHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3TMrZpWHgSDZrljhmzmtjqfG0vpTYK+5Cdm/pQAj51M=;
	b=pEMwVIFxd7ZgqH+KPevCYzXMv9hRlOjKfVR0kZA8VMx0xAIJIppBI9t55zTsC6agIhLw
	 2XoFp28f5ZTvTy0oqsv4NOSO9sFkIhlxWyU8FZdRAtTC+wOlW91TmxNkhxR6wxbbd99zI
	 3qgNHCfhAtrayr6F2wROEb5homopLsH1evvEa/WqONAi+K3+WkVoLl7L+aPdu2kpBn5dh
	 Xv81zo0sVQZ/hHlbJgFHQdcdRZgdn7p7YXWzrJJ4pC+xeHDCZF0hcPqneSMpAl10jYicI
	 r1vZYRD15fbUvBcZOwjEbEvqEL1Vi+JaFVE3MCnAIr84SB9kcfcGaOGAQSiqZ+/9qCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HtyPzr4f;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2D8606A31E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 19:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D2D8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HtyPzr4f
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso26659525e9.1
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 11:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795462456; x=1796067256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3TMrZpWHgSDZrljhmzmtjqfG0vpTYK+5Cdm/pQAj51M=;
        b=HtyPzr4frRzcrFY4jKAEMBbjBJG7Vv3sEIESSwFqegOnl2F0XuHk9pXFK2QNgUZuH1
         g0i+KauYh+CxPASDwESsi88ezjkGxOIMcxPoNW85ZqFuJYAUUd5d3C+k1PurIKvXo7iI
         4B3jAuVOzJ5en8jQO/RxAx/xju6NMXE/mzs6cAuD7zZiR+O5a636cs0FfiFE8+F+CfzG
         AKLukKnVHGG6irt8VXtHs3MM9Ebdg2FvsT8sOf1uWbFCF1fi3vVR2EWejcQ6MFCz0ons
         FRs7tWyN60YN+0foFJM4z5PakaZj1m6bUAeLLbdbhFwSsJhTzG0Z+h1HdJjTXJKEpPT2
         O57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462456; x=1796067256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3TMrZpWHgSDZrljhmzmtjqfG0vpTYK+5Cdm/pQAj51M=;
        b=IDAj0AdCl6iu4E60DNuWRyDT/ZM3W8I4wse7Kk31HA9XC0VTMsqE43jgWlwb44VJP9
         hkOcOurR0bdYS+B+r/C9DfcbUZJC0C69C/9CTt04NsBeTTCfN20sYBl4MaJSnlGSjiCz
         jB5u13q1GL7uDd8q8oHTnrJxKddqTXSSujW+VDtg+u3h2TOdEv9p47sNYSNg1KXpmemW
         e6WI4QhPzTPMj+P0h4vZtoEPNpG863iSwnob/hJNFZkbXxEuJ8JaHK2jCgXwd7SrnJMp
         KdD0YMbkAyNk6n7rW7WG9+H5rzZRl0PrBSU88HO0oiNMUMRoE1hzMK2Ayd6lwz+jlFaJ
         1wMA==
X-Gm-Message-State: APuU4Z/Fhj+CTgaejCHp4FxbJOQrfnkNb6ywQn7zbs6ZeRnV5N/kPosR
	LfobBnJWrjRdxHAoB/Rk7gqS1cFX9HEv85qkscaQkHHUCwhgZRFSnIOJMtkPTQ==
X-Gm-Gg: AZFdTZemBz0Je0StzXhHfg3EjaMDD/nve0t4N//a7rMmr8zDeynQvI2RcTDzhDYfOWR
	5i4HALJrDOUnxlI49q1aT2fY6u3c1Qe7UDA8SvPbSIquLC61tgTIQwRMjb61AYKEDSyK/OW3ZGo
	hxAqiH19HeaBe6SNzLhW5q1Wa2W0rUnRDXkgbHi1ZrxN9m6EeSMjaKSIAi9wunlZJCeHwbMLcYG
	h91QsGSZOh5rU32wUuttzylvcg12c53hjSRVPo2WNfdcuUSkvak+kWLHCqSHXab3J6oowS5j5oC
	Pw7vyz7lchhvIkaodUWXvurDY9yUPQEaoTZ3g/0oUDVP3Hc6I80/Po0BOfxZ8LHlya3wqnKFp9H
	Q4fYSQWiKs8nFOUfRQBmt1afkSKjHrXMXUAQHnOlTy2pxHPwHAONc2vwnevWYi7ChRMu5y8E2m+
	ImY6g2ZaqbtrwkfP4b1xZeuDVn1K8T/gRUGHzKPyYzf7mNVnOgKU3mr66zZ9SOgh9XXL0R2jXxv
	0lc2pkHLliR/v7yeQwRymNZq3UzX4B0PH8W3TTr1U0gZsuz054int3IZxaXwCCPUE7Td3MmuhCJ
	WXER8Bp0Q7HIhz35HDPLAGx2RxzNL4kSqEsuLWoDKGXsxOoFQQv9HhbPH6zjSJJZjg9c0WPQGRr
	Z98H5ZRuLP7Hdye16OGHNlpwJX+JqE3Y6Kcn5v4dlnXAQay8hOx6CdikOTIY1Vf3ibTPcd7olJs
	11b0fsmJVgl5keiXtCmS2nRb/ovWqEUs6KZTgh8TgMbxkP8gOFAIST
X-Received: by 2002:a05:600c:1547:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb8880974amr288937775e9.8.1795462455402;
        Mon, 23 Nov 2026 11:34:15 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-f512-85ee-fdbe-0621.ipv6.o2.cz. [2a00:1028:8388:a84e:f512:85ee:fdbe:621])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm184918925e9.3.2026.11.23.11.34.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 11:34:14 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: [PATCH rtw-next] wifi: rtw89: 8922a: redo channel RFK on a bad DPK result
Date: Mon, 23 Nov 2026 20:34:13 +0100
Message-ID: <20261123193413.71430-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
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

On RTL8922AU the channel calibration at AP start sometimes leaves path B
with a bad DPK result while the firmware reports success. The DPK TX AGC
of path B is then far below path A, or path B is not ok, and the AP
hardly gets frames to its clients until it is restarted. The TSSI and
IQK results of path B are off in the same runs.

Keep the DPK report the firmware sends and redo the whole channel
calibration when a path is not ok or timed out, or the TX AGC of the two
paths differs by more than 5, at most three times. The check runs only
when the PHY owns both paths.

Tested on RTL8922AU over USB in AP mode: 12 bad first calibrations in
145 AP starts, all good on the second try. No stall in 105 starts with
a client, against 4 of 80 without the patch.

Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
The check comes from one adapter. Is the DPK TX AGC gap, path_ok and
is_timeout the right thing to look at, or is there a better result the
driver should check? Or should the firmware handle this? The report is
kept in rfk_wait for now. Would rtwdev->dpk be better, like
rtwdev->iqk?

The older chips do it differently. RTL8852B runs DPK in the driver and
switches DPD off on a failed path, and rtw88 does the same on RTL8822C
after checking the coefficients. Neither redoes the calibration. Here
the firmware reports the bad path as ok in most runs, and TSSI and IQK
of that path are off as well, so this patch redoes the whole channel
calibration. Would switching DPD off on path B be preferred, at least
after the third bad try? The H2C has a dpk_enable byte, I did not try
it.

Details, RTL8922AU (Cudy BE6500), firmware 0.35.80.3, backports 7.2 on
Linux 6.18 (OpenWrt) unless noted:
- 5 to 15 percent of AP starts on channel 36 get the bad calibration,
  the rate varies over time. Every one I tested with a client stalled
  the AP (beacon loss on the client, a few Mbit/s). The rtw89 code of
  early November (morrownr/rtw89 f2ce66e) behaves the same.
- With that morrownr build, which has diag_rf, running only the channel
  calibration again fixed the same AP 3 of 3 times without a restart.
  40 such runs in a row on a running AP (morrownr build on Turris OS)
  were all good, so it seems to hit only the first calibration shortly
  after the chip comes up. It also happens with the client powered off.
- Not the cause: skipping the PHY_1 channel setup in MLO 2+0 mode (5 of
  40 starts still bad) and calling rfk_mlo_ctrl at the start of
  rfk_init_late as RTL8922D does (4 of 40 still bad).
- The firmware sends the DPK report also with RFK debug off. All reports
  I logged had is_timeout 0. RFK debug was on in all 145 starts of the
  test line. With it off, earlier versions of this patch ran 40 starts
  with a client without a stall, one of them with a visible retry.
- With RFK debug on, the DPK report came 0.01 to 0.04 ms after its RFK
  state report in 34 runs over USB. The driver already waits for every
  RFK state report on the one shared rfk_wait.completion, and the DPK
  report relies on the same assumption.
- DPK TX AGC A/B (hex), good: 37/34, 36/34 and 36/33 on channel 36,
  38/39, 38/35 and 38/36 on channel 149, 37/37 on 2.4 GHz channel 6.
  Bad: path B at 28 to 30, or 00 with path_ok 0. The DPK correlation of
  path B does not separate them (good 220 to 250, bad 166 to 241).
- Channel 149: no retry in 30 AP starts, but 3 of them had the TSSI
  alignment of path B done and path B at 35 or 36 instead of 39. Traffic
  on that channel is untested.
- No RFK step reported a failure in the 822 AP starts I have console
  logs for, so the decision uses only the DPK report.
- Only the whole sequence was tested as the retry. Redoing only DPK is
  untested. diag_rf records only the last try. The "no DPK report" path
  and the "DPK still bad" warning never ran.
- Built and run only as a backport to 7.2. This rtw-next version was not
  compiled.
- Tested only as an AP over USB with both antennas. Station mode, PCIe,
  6 GHz, MLO, antenna masks and one-antenna boards are untested,
  although the function runs there too.
- A missing report is accepted as before, so firmware without the report
  and SER, where C2H events are not received, do not retry.

 drivers/net/wireless/realtek/rtw89/core.c     |  1 +
 drivers/net/wireless/realtek/rtw89/core.h     |  8 +++
 drivers/net/wireless/realtek/rtw89/phy.c      |  7 ++
 drivers/net/wireless/realtek/rtw89/rtw8922a.c | 67 +++++++++++++++++--
 4 files changed, 77 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 0f36185c19b..069bad16b78 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -7113,6 +7113,7 @@ int rtw89_core_init(struct rtw89_dev *rtwdev)
 
 	init_completion(&rtwdev->fw.req.completion);
 	init_completion(&rtwdev->rfk_wait.completion);
+	init_completion(&rtwdev->rfk_wait.dpk_rpt.done);
 
 	schedule_work(&rtwdev->load_firmware_work);
 
diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
index 87a832b5c29..f65b4ba7eba 100644
--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ -6742,11 +6742,19 @@ struct rtw89_rfk_record {
 	enum rtw89_rfk_report_state states[NUM_OF_RTW89_RFK_REPORT_TYPES];
 };
 
+struct rtw89_rfk_dpk_rpt {
+	struct completion done;
+	u8 path_ok[2];
+	u8 txagc[2];
+	u8 is_timeout[2];
+};
+
 struct rtw89_rfk_wait_info {
 	struct completion completion;
 	ktime_t start_time;
 	enum rtw89_rfk_report_state state;
 	u8 version;
+	struct rtw89_rfk_dpk_rpt dpk_rpt;
 
 	int record_idx;
 	struct rtw89_rfk_record *record_ptr;
diff --git a/drivers/net/wireless/realtek/rtw89/phy.c b/drivers/net/wireless/realtek/rtw89/phy.c
index 9a7e032f7c8..0e6f36d4822 100644
--- a/drivers/net/wireless/realtek/rtw89/phy.c
+++ b/drivers/net/wireless/realtek/rtw89/phy.c
@@ -3563,6 +3563,7 @@ static void rtw89_phy_c2h_rfk_rpt_log(struct rtw89_dev *rtwdev,
 	struct rtw89_c2h_rf_dack_rpt_log *dack;
 	struct rtw89_c2h_rf_tssi_rpt_log *tssi;
 	struct rtw89_c2h_rf_dpk_rpt_log *dpk;
+	struct rtw89_rfk_dpk_rpt *dpk_rpt;
 	struct rtw89_c2h_rf_iqk_rpt_log *iqk;
 	int i, j, k;
 
@@ -3660,6 +3661,11 @@ static void rtw89_phy_c2h_rfk_rpt_log(struct rtw89_dev *rtwdev,
 			goto out;
 
 		dpk = content;
+		dpk_rpt = &rtwdev->rfk_wait.dpk_rpt;
+		memcpy(dpk_rpt->path_ok, dpk->path_ok, sizeof(dpk_rpt->path_ok));
+		memcpy(dpk_rpt->txagc, dpk->txagc, sizeof(dpk_rpt->txagc));
+		memcpy(dpk_rpt->is_timeout, dpk->is_timeout, sizeof(dpk_rpt->is_timeout));
+		complete(&dpk_rpt->done);
 		rtw89_debug(rtwdev, RTW89_DBG_RFK,
 			    "DPK ver:%d idx:%2ph band:%2ph bw:%2ph ch:%2ph path:%2ph\n",
 			    dpk->ver, dpk->idx, dpk->band, dpk->bw, dpk->ch, dpk->path_ok);
@@ -4258,6 +4264,7 @@ int rtw89_phy_rfk_dpk_and_wait(struct rtw89_dev *rtwdev,
 	int ret;
 
 	rtw89_phy_rfk_report_prep(rtwdev);
+	reinit_completion(&rtwdev->rfk_wait.dpk_rpt.done);
 
 	ret = rtw89_fw_h2c_rf_dpk(rtwdev, phy_idx, chan);
 	if (ret)
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8922a.c b/drivers/net/wireless/realtek/rtw89/rtw8922a.c
index 37eb5ed3659..cc384363a00 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8922a.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8922a.c
@@ -2385,6 +2385,47 @@ static void _wait_rx_mode(struct rtw89_dev *rtwdev, u8 kpath)
 	}
 }
 
+#define RTW8922A_RFK_CHANNEL_TRIES 3
+#define RTW8922A_DPK_TXAGC_GAP_MAX 5
+#define RTW8922A_DPK_RPT_TIMEOUT_MS 20
+
+static bool rtw8922a_dpk_rpt_ok(struct rtw89_dev *rtwdev,
+				enum rtw89_phy_idx phy_idx, int try)
+{
+	struct rtw89_rfk_dpk_rpt *rpt = &rtwdev->rfk_wait.dpk_rpt;
+	unsigned long timeout = msecs_to_jiffies(RTW8922A_DPK_RPT_TIMEOUT_MS);
+	u8 path;
+
+	/* In MLO 1+1 mode each PHY owns one path, so there is nothing to
+	 * compare.
+	 */
+	if (rtw89_phy_get_kpath(rtwdev, phy_idx) != RF_AB)
+		return true;
+
+	/* Firmware without the report, and SER where C2H events are not
+	 * received, keep the old behaviour without a retry.
+	 */
+	if (!wait_for_completion_timeout(&rpt->done, timeout)) {
+		rtw89_debug(rtwdev, RTW89_DBG_RFK,
+			    "[RFK] try %d: no DPK report\n", try);
+		return true;
+	}
+
+	for (path = RF_PATH_A; path <= RF_PATH_B; path++)
+		if (!rpt->path_ok[path] || rpt->is_timeout[path])
+			goto bad;
+
+	if (abs_diff(rpt->txagc[RF_PATH_A], rpt->txagc[RF_PATH_B]) <=
+	    RTW8922A_DPK_TXAGC_GAP_MAX)
+		return true;
+
+bad:
+	rtw89_debug(rtwdev, RTW89_DBG_RFK,
+		    "[RFK] try %d: DPK path_ok %2ph timeout %2ph txagc %2ph, redo\n",
+		    try, rpt->path_ok, rpt->is_timeout, rpt->txagc);
+	return false;
+}
+
 static void rtw8922a_rfk_channel(struct rtw89_dev *rtwdev,
 				 struct rtw89_vif_link *rtwvif_link)
 {
@@ -2393,17 +2434,31 @@ static void rtw8922a_rfk_channel(struct rtw89_dev *rtwdev,
 	enum rtw89_phy_idx phy_idx = rtwvif_link->phy_idx;
 	u8 phy_map = rtw89_btc_phymap(rtwdev, phy_idx, RF_AB, chanctx_idx);
 	u32 tx_en;
+	bool ok = false;
+	int try;
 
 	rtw89_btc_ntfy_wl_rfk(rtwdev, phy_map, BTC_WRFKT_CHLK, BTC_WRFK_START);
 	rtw89_chip_stop_sch_tx(rtwdev, phy_idx, &tx_en, RTW89_SCH_TX_SEL_ALL);
 	_wait_rx_mode(rtwdev, RF_AB);
 
-	rtw89_phy_rfk_pre_ntfy_and_wait(rtwdev, phy_idx, 5);
-	rtw89_phy_rfk_txgapk_and_wait(rtwdev, phy_idx, chan, 54);
-	rtw89_phy_rfk_iqk_and_wait(rtwdev, phy_idx, chan, 84);
-	rtw89_phy_rfk_tssi_and_wait(rtwdev, phy_idx, chan, RTW89_TSSI_NORMAL, 20);
-	rtw89_phy_rfk_dpk_and_wait(rtwdev, phy_idx, chan, 34);
-	rtw89_phy_rfk_rxdck_and_wait(rtwdev, RTW89_PHY_0, chan, true, 32);
+	/* A bad DPK comes with bad TSSI and IQK results of the same path,
+	 * so redo the whole channel calibration, not only DPK.
+	 */
+	for (try = 1; try <= RTW8922A_RFK_CHANNEL_TRIES; try++) {
+		rtw89_phy_rfk_pre_ntfy_and_wait(rtwdev, phy_idx, 5);
+		rtw89_phy_rfk_txgapk_and_wait(rtwdev, phy_idx, chan, 54);
+		rtw89_phy_rfk_iqk_and_wait(rtwdev, phy_idx, chan, 84);
+		rtw89_phy_rfk_tssi_and_wait(rtwdev, phy_idx, chan, RTW89_TSSI_NORMAL, 20);
+		rtw89_phy_rfk_dpk_and_wait(rtwdev, phy_idx, chan, 34);
+		ok = rtw8922a_dpk_rpt_ok(rtwdev, phy_idx, try);
+		rtw89_phy_rfk_rxdck_and_wait(rtwdev, RTW89_PHY_0, chan, true, 32);
+		if (ok)
+			break;
+	}
+
+	if (!ok)
+		rtw89_warn(rtwdev, "DPK still bad after %d tries\n",
+			   RTW8922A_RFK_CHANNEL_TRIES);
 
 	rtw89_chip_resume_sch_tx(rtwdev, phy_idx, tx_en);
 	rtw89_btc_ntfy_wl_rfk(rtwdev, phy_map, BTC_WRFKT_CHLK, BTC_WRFK_STOP);

base-commit: 8b29fd95e2d3cb80564eb7cb34248b844422ba1e
-- 
2.54.0 (Apple Git-157)

