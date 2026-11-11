Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399340;
	b=e8KQk3lGlKl/L/90ipB3jNtbfhcSCjdfDp+vejYr3M8sP9JVsCGU1aHgsC0F4fVS9jbv
	 VJUiQ6K1GTLK1YHhNM5jSh7oPoSB0EsHt6tGWZ73VBQiJ4zk2oq38fU/DC7ss4LN5ZeoJ
	 m0XRMJsNd8aDNAdbBRaMNUKUsZN2XArOZIpdzqu19gJRvyShOMR+d926fM4KZeZcksHHG
	 aKT0mfHjWjFFs0isdvSSPsf8V0baXo8TFxyTT6/5Kl3t5cGKk5m1arOEfLaKMcC4N6OJB
	 m/JZqpXEj7KOe5L7FbfxS75g37aB0SdkRM1OQIiVGnS5jd+joU6kRujqe7MZC0gnvwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xLKDoG8Y8iRARg7JYtTZOJ2lqZKLMYm7ljsYwLFPrpg=;
	b=HLPobmf87qp9ldNFh/GfW/mWBiGZJijb7D2ghWrfj3LvecKozuuWw9yrIovuf2EQMGIX
	 Gm59tIWJg5mFxcKycrpoKQ90SNJpNxAu/UXK3/cd34mONZYpuYIhLKzWu8cpBLSWk127d
	 YNH43E561snbSCoovYPM7UIKHRGOLAZsPkCz2zh6PcOA0RAAk8lgxIGIN5LbHQSy97lIj
	 40W/E6tZlJg299p05/Dody6lyG5tDXPq/q/N3YACbLU1BL+eKwDYn3hr6FCJDxjAE75cZ
	 YAgazZdnyMUFeVmGKu1hXNZNtVy+f7cweBbrcvIwxXOCRhrSVtUnLQtNqN/1AUBHpUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Js1zoNNu;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7792E60A382C
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 12:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7792E60A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Js1zoNNu
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91f0c4f7a8fso2495976d6.2
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 04:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794399333; x=1795004133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xLKDoG8Y8iRARg7JYtTZOJ2lqZKLMYm7ljsYwLFPrpg=;
        b=Js1zoNNuN4rQVInAZWob89ekY9lwA9CfTbNsInx935h9FdIReqloS9Ygr4Mf4iId5D
         ktr0AFqFw0tPF6Cv5DxAvoLZI53vxIGP64rN9ONAH4Pqc/NcmBgdPoXsy50XAJl6lQfp
         2kuT+uPj7sVlKhsSShZtDNIyLEkkojNug52QbHjXgm+7iTpm8DhFWpLka8aC3GFftVBV
         mou+6wKH/QxlJtI+gD8YcBghCF1tyTim6DJhZomsQqC+h83C2YZQxci/nfqmhoea4AUq
         j45FZsux29vUPQF9Dgv+yHcS2Sd1J4wNOiBpBIDJ9D8LRtZLSytkASUfWiE207hoEzfd
         HJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399333; x=1795004133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xLKDoG8Y8iRARg7JYtTZOJ2lqZKLMYm7ljsYwLFPrpg=;
        b=XKCuTMPc++9Hc3CuDavFDY0TN3H8N8WAvPjkPLjPWl8Bn7+hLqBcwhbykfUNSgC3r2
         qKXs4JUKtT4V+ePnyzu0Fk4bbq9dUwmQFKxNEbBMLducXyY8epSrSkXIyuaJqhnlf9CF
         g2jFNVzu7w7bm/05BpYSF/XmEbr+JrH0CxoePBbyuBlLFZyiisitquwhhULmud8AoxQn
         +kHBe9O755QjubZI79cN6jk+a52t+mm2Fafux96EFH0DRtETThI7J45xlae1+soZZwgR
         ct8E3ygS43W9NjLW8CB6XNmaFNvVpm7aCfBqppDJzOICIkORtn9BBPg1s2+BuScqeyb9
         4aTQ==
X-Forwarded-Encrypted: i=1; AL+hErFNJCWkq7M6eU+4rxvUDBwBna8CqO5+bziUzG3wY8RbJ7WyyiOjLFPtqkmmsesXExSOxu3WUsI/pTYDnX31ow==@vger.kernel.org
X-Gm-Message-State: APuU4Z/rXJltrCb6tC2o7DPp5+J6iuLZwFTuTwm2+smbfOvYPJHEGs5U
	6NlGNrTkJUUcGtEtwIxWiZ79+WGPIL1EO5mpX4cyt8Bm8C1GYXGVQyBj
X-Gm-Gg: AYBFou2wm9Vnx0kVPth+P5CzVvo1LBFgwBPC3Vxi/WVd/NwC+yTWTaY6FQg06rctTRr
	Gnx8Bo9Zg/lWMexZ0ql9ZX/C4iSS1V/tRrjHvlqy9Efph/ocod9R71Kq8BS1YimF1Ch9s+FMyUk
	mFgbGxbCRxvtx1yobh38/TdiT3H/qGQdd3sd2vX4mHINJnCKvz6GnlIXRyJeEcNxrbs/MTBEWzO
	uhyRVaGhNU8cBHGtInUhp2vxjINHpY7vY1DSEevsWS/M5DDcWPc+vR/voo7QN588/yqhPs+oaFz
	SBm379p/JJbAxMI5Mt2+3hZkuHmR0GoSadY+ACKn/MKi4BmR25lbpomfT/8OowpZk1/QKgqw/dL
	3WTSjTqTYTCZqduzpjkkl7Runt94OH2ljoxG0QDufkTCKWF01Bi3GREN+PP4uSrqaj3dZrP9YWU
	KRpOUaUEV0mVcYexSA7BlIHbKBRwieI7mq0T7mYkdZBp2WO2kB8Svo2X1GuXQr7cGtt2gKCXQyH
	Ma2LAEZkpn2UgAtlToLjbfW2iOoY1WyhvRNrFYJgRU5zDEAsFdUh0DYZc4wqyjEU1hJtPN9tLSk
	ydOkkRMpuOxLz4zBvysRGNbVm4eHCVZfQvyeecsfU4msQEek5ZsjWQ0s
X-Received: by 2002:ad4:5d68:0:b0:911:9373:a171 with SMTP id 6a1803df08f44-91f04023194mr36797996d6.30.1794399333104;
        Wed, 11 Nov 2026 04:15:33 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f02ca1ed7sm22042626d6.24.2026.11.11.04.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:15:32 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v10 2/3] wifi: rtw88: support channel switch in AP mode
Date: Wed, 11 Nov 2026 13:15:24 +0100
Message-ID: <20261111121525.358041-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111121525.358041-1-mehmet.fide@gmail.com>
References: <20261111121525.358041-1-mehmet.fide@gmail.com>
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

hostapd's CHAN_SWITCH is refused because the driver does not announce
channel switch support, so an rtw88 AP can only change its channel by
being torn down and started again.

Declare WIPHY_FLAG_HAS_CHANNEL_SWITCH and implement
channel_switch_beacon: the firmware repeats the beacon held in the
first reserved page, so while a switch is announced the page is
downloaded again every beacon interval to advance the countdown, and
ieee80211_csa_finish() is called once it completes. IBSS shares the
page and the work.

The work is a delayed work of the device and csa_vif names the
interface, both under the driver mutex. The countdown is cancelled when
the AP stops, when the interface goes away, on WoWLAN suspend and in
rtw_core_stop(); the BSS_CHANGED_BEACON replay after a hardware restart
resumes it, and so does the driver after a WoWLAN resume, which mac80211
follows with no replay. The other page downloads during a countdown, the
TIM update, the PG backup and the one on association, are skipped until
the beacon after the switch, since every beacon fetch advances the
countdown; the next download carries their changes. A scan is refused:
it would take the AP off the channel its stations count down to.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Changes in v10:
    - rtw_core_stop() clears csa_vif and cancels the countdown work again
      once it has the mutex back: a switch started while the mutex was
      dropped kept csa_vif, so the restart after a firmware recovery did
      not resume the countdown, and a work queued then could run early into
      the countdown the restart resumes (Luka)
    - rebased on rtw-next
    
    Changes in v9:
    - the countdown starts again after a WoWLAN resume that worked, which
      mac80211 follows with no replay (Luka)
    - Acked-by from Ping-Ke dropped for the new code
    
    Changes in v8:
    - Acked-by from Ping-Ke
    
    Changes in v7:
    - csa_vif is kept until the beacon after the switch: a TIM update
      before it fetched one beacon past count 1 and hit the WARN in
      ieee80211_beacon_update_cntdwn()
    - rebased on rtw-next
    
    Changes in v6:
    - the countdown work is an ieee80211 delayed work under the driver
      mutex, csa_vif is driver state under the mutex; no wiphy lock in
      rtw88 (Ping-Ke)
    - rtw_core_stop() cancels the work and clears csa_vif, which covers the
      IPS path and the firmware recovery (Ping-Ke)
    - the downloads are paced from the first one with an absolute due time:
      queued after each download, the countdown drifted by about 10 ms per
      beacon interval on the ordered mac80211 workqueue, and a station
      switched ahead of the AP on a count of 50
    - the BSS_CHANGED_BEACON path says why it starts the countdown (the
      replay after a hardware restart) and stops it when the beacon comes
      back without a switch announced (Ping-Ke)
    
    Changes in v5:
    - rtw_fw_csa_active/start/stop() assert the wiphy lock
    - hw_scan() takes the mutex with guard()
    - the ASSOC path says why it skips the download: the STA+AP combination
    
    Changes in v4:
    - the work and csa_vif live in rtw_dev; no lookup through the reserved page
    - the countdown is stopped before a firmware recovery restarts the hardware
    - a scan is refused while a switch is announced
    - one beacon fetch per interval during the countdown

 drivers/net/wireless/realtek/rtw88/fw.c       | 80 ++++++++++++++++++-
 drivers/net/wireless/realtek/rtw88/fw.h       |  4 +
 drivers/net/wireless/realtek/rtw88/mac80211.c | 50 ++++++++++--
 drivers/net/wireless/realtek/rtw88/main.c     |  9 ++-
 drivers/net/wireless/realtek/rtw88/main.h     |  3 +
 5 files changed, 138 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 3cd17a3bb494..2d81aaeed0d7 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -1802,14 +1802,90 @@ int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev)
 	return ret;
 }
 
+bool rtw_fw_csa_active(struct rtw_dev *rtwdev)
+{
+	lockdep_assert_held(&rtwdev->mutex);
+
+	return !!rtwdev->csa_vif;
+}
+
+/* paced from the first download: a late one does not delay the next */
+static void rtw_fw_csa_queue(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
+{
+	u32 interval = ieee80211_tu_to_usec(vif->bss_conf.beacon_int);
+	s64 delay;
+
+	rtwdev->csa_due = ktime_add_us(rtwdev->csa_due, interval);
+	delay = ktime_us_delta(rtwdev->csa_due, ktime_get());
+	ieee80211_queue_delayed_work(rtwdev->hw, &rtwdev->csa_beacon_work,
+				     usecs_to_jiffies(max(delay, 0)));
+}
+
+void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
+{
+	lockdep_assert_held(&rtwdev->mutex);
+
+	if (rtwdev->csa_vif == vif)
+		return;
+
+	rtwdev->csa_vif = vif;
+	rtwdev->csa_due = ktime_get();
+	rtw_fw_csa_queue(rtwdev, vif);
+}
+
+void rtw_fw_csa_stop(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
+{
+	lockdep_assert_held(&rtwdev->mutex);
+
+	if (!vif || rtwdev->csa_vif != vif)
+		return;
+
+	rtwdev->csa_vif = NULL;
+	cancel_delayed_work(&rtwdev->csa_beacon_work);
+}
+
 void rtw_fw_update_beacon_work(struct work_struct *work)
 {
 	struct rtw_dev *rtwdev = container_of(work, struct rtw_dev,
 					      update_beacon_work);
 
 	mutex_lock(&rtwdev->mutex);
-	rtw_fw_download_rsvd_page(rtwdev);
-	rtw_send_rsvd_page_h2c(rtwdev);
+
+	/* a fetch advances the countdown, the next download carries the TIM */
+	if (!rtw_fw_csa_active(rtwdev)) {
+		rtw_fw_download_rsvd_page(rtwdev);
+		rtw_send_rsvd_page_h2c(rtwdev);
+	}
+
+	mutex_unlock(&rtwdev->mutex);
+}
+
+void rtw_fw_csa_beacon_work(struct work_struct *work)
+{
+	struct rtw_dev *rtwdev = container_of(work, struct rtw_dev,
+					      csa_beacon_work.work);
+	struct ieee80211_vif *vif;
+
+	mutex_lock(&rtwdev->mutex);
+
+	vif = rtwdev->csa_vif;
+	if (!vif)
+		goto out;
+
+	if (!vif->bss_conf.csa_active) {
+		rtwdev->csa_vif = NULL;
+		goto out;
+	}
+
+	if (!ieee80211_beacon_cntdwn_is_complete(vif, 0)) {
+		rtw_fw_download_rsvd_page(rtwdev);
+		rtw_send_rsvd_page_h2c(rtwdev);
+		rtw_fw_csa_queue(rtwdev, vif);
+	} else {
+		ieee80211_csa_finish(vif, 0);
+	}
+
+out:
 	mutex_unlock(&rtwdev->mutex);
 }
 
diff --git a/drivers/net/wireless/realtek/rtw88/fw.h b/drivers/net/wireless/realtek/rtw88/fw.h
index 48ad9ceab6ea..d8e58e4ed836 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.h
+++ b/drivers/net/wireless/realtek/rtw88/fw.h
@@ -863,7 +863,11 @@ void rtw_add_rsvd_page_pno(struct rtw_dev *rtwdev,
 void rtw_add_rsvd_page_sta(struct rtw_dev *rtwdev,
 			   struct rtw_vif *rtwvif);
 int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev);
+bool rtw_fw_csa_active(struct rtw_dev *rtwdev);
+void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif);
+void rtw_fw_csa_stop(struct rtw_dev *rtwdev, struct ieee80211_vif *vif);
 void rtw_fw_update_beacon_work(struct work_struct *work);
+void rtw_fw_csa_beacon_work(struct work_struct *work);
 void rtw_send_rsvd_page_h2c(struct rtw_dev *rtwdev);
 int rtw_dump_drv_rsvd_page(struct rtw_dev *rtwdev,
 			   u32 offset, u32 size, u32 *buf);
diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 5e40cf06a9e3..e6c9866fd599 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -237,6 +237,8 @@ static void rtw_ops_remove_interface(struct ieee80211_hw *hw,
 
 	mutex_lock(&rtwdev->mutex);
 
+	rtw_fw_csa_stop(rtwdev, vif);
+
 	rtw_leave_lps_deep(rtwdev);
 
 	rtw_txq_cleanup(rtwdev, vif->txq);
@@ -395,8 +397,11 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 		if (vif->cfg.assoc) {
 			rtw_coex_connect_notify(rtwdev, COEX_ASSOCIATE_FINISH);
 
-			rtw_fw_download_rsvd_page(rtwdev);
-			rtw_send_rsvd_page_h2c(rtwdev);
+			/* a station associating while the AP counts down */
+			if (!rtw_fw_csa_active(rtwdev)) {
+				rtw_fw_download_rsvd_page(rtwdev);
+				rtw_send_rsvd_page_h2c(rtwdev);
+			}
 			rtw_fw_default_port(rtwdev, rtwvif);
 			rtw_coex_media_status_notify(rtwdev, vif->cfg.assoc);
 			if (rtw_bf_support)
@@ -438,6 +443,11 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 		rtw_set_dtim_period(rtwdev, conf->dtim_period);
 		rtw_fw_download_rsvd_page(rtwdev);
 		rtw_send_rsvd_page_h2c(rtwdev);
+		/* restart replay resumes it, a beacon without CSA ends it */
+		if (conf->csa_active)
+			rtw_fw_csa_start(rtwdev, vif);
+		else
+			rtw_fw_csa_stop(rtwdev, vif);
 	}
 
 	if (changed & BSS_CHANGED_BEACON_ENABLED) {
@@ -490,6 +500,7 @@ static void rtw_ops_stop_ap(struct ieee80211_hw *hw,
 	struct rtw_dev *rtwdev = hw->priv;
 
 	mutex_lock(&rtwdev->mutex);
+	rtw_fw_csa_stop(rtwdev, vif);
 	rtw_write32_clr(rtwdev, REG_TCR, BIT_TCR_UPDATE_HGQMD);
 	rtw_write16(rtwdev, REG_ATIMWND, ATIMWND_DEFAULT);
 	rtwdev->ap_active = false;
@@ -556,6 +567,17 @@ static int rtw_ops_set_tim(struct ieee80211_hw *hw, struct ieee80211_sta *sta,
 	return 0;
 }
 
+static void rtw_ops_channel_switch_beacon(struct ieee80211_hw *hw,
+					  struct ieee80211_vif *vif,
+					  struct cfg80211_chan_def *chandef)
+{
+	struct rtw_dev *rtwdev = hw->priv;
+
+	mutex_lock(&rtwdev->mutex);
+	rtw_fw_csa_start(rtwdev, vif);
+	mutex_unlock(&rtwdev->mutex);
+}
+
 static int rtw_ops_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 			   struct ieee80211_vif *vif, struct ieee80211_sta *sta,
 			   struct ieee80211_key_conf *key)
@@ -626,7 +648,8 @@ static int rtw_ops_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	}
 
 	/* download new cam settings for PG to backup */
-	if (rtw_get_lps_deep_mode(rtwdev) == LPS_DEEP_MODE_PG)
+	if (rtw_get_lps_deep_mode(rtwdev) == LPS_DEEP_MODE_PG &&
+	    !rtw_fw_csa_active(rtwdev))
 		rtw_fw_download_rsvd_page(rtwdev);
 
 out:
@@ -846,6 +869,7 @@ static int rtw_ops_suspend(struct ieee80211_hw *hw,
 	int ret;
 
 	mutex_lock(&rtwdev->mutex);
+	rtw_fw_csa_stop(rtwdev, rtwdev->csa_vif);
 	ret = rtw_wow_suspend(rtwdev, wowlan);
 	if (ret)
 		rtw_err(rtwdev, "failed to suspend for wow %d\n", ret);
@@ -854,6 +878,15 @@ static int rtw_ops_suspend(struct ieee80211_hw *hw,
 	return ret ? 1 : 0;
 }
 
+static void rtw_ops_csa_resume_iter(void *data, struct ieee80211_vif *vif)
+{
+	struct rtw_dev *rtwdev = data;
+
+	if ((vif->type == NL80211_IFTYPE_AP ||
+	     vif->type == NL80211_IFTYPE_ADHOC) && vif->bss_conf.csa_active)
+		rtw_fw_csa_start(rtwdev, vif);
+}
+
 static int rtw_ops_resume(struct ieee80211_hw *hw)
 {
 	struct rtw_dev *rtwdev = hw->priv;
@@ -863,6 +896,8 @@ static int rtw_ops_resume(struct ieee80211_hw *hw)
 	ret = rtw_wow_resume(rtwdev);
 	if (ret)
 		rtw_err(rtwdev, "failed to resume for wow %d\n", ret);
+	else
+		rtw_iterate_vifs(rtwdev, rtw_ops_csa_resume_iter, rtwdev);
 	mutex_unlock(&rtwdev->mutex);
 
 	return ret ? 1 : 0;
@@ -893,20 +928,24 @@ static int rtw_ops_hw_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	struct rtw_dev *rtwdev = hw->priv;
 	int ret;
 
+	guard(mutex)(&rtwdev->mutex);
+
+	/* a scan takes the AP off the channel its stations count down to */
+	if (rtw_fw_csa_active(rtwdev))
+		return -EBUSY;
+
 	if (!rtw_fw_feature_check(&rtwdev->fw, FW_FEATURE_SCAN_OFFLOAD))
 		return 1;
 
 	if (test_bit(RTW_FLAG_SCANNING, rtwdev->flags))
 		return -EBUSY;
 
-	mutex_lock(&rtwdev->mutex);
 	rtw_hw_scan_start(rtwdev, vif, req);
 	ret = rtw_hw_scan_offload(rtwdev, vif, true);
 	if (ret) {
 		rtw_hw_scan_abort(rtwdev);
 		rtw_err(rtwdev, "HW scan failed with status: %d\n", ret);
 	}
-	mutex_unlock(&rtwdev->mutex);
 
 	return ret;
 }
@@ -973,6 +1012,7 @@ const struct ieee80211_ops rtw_ops = {
 	.sta_add		= rtw_ops_sta_add,
 	.sta_remove		= rtw_ops_sta_remove,
 	.set_tim		= rtw_ops_set_tim,
+	.channel_switch_beacon	= rtw_ops_channel_switch_beacon,
 	.set_key		= rtw_ops_set_key,
 	.ampdu_action		= rtw_ops_ampdu_action,
 	.can_aggregate_in_amsdu	= rtw_ops_can_aggregate_in_amsdu,
diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index f7708ad17b6f..4d9837b07ebf 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1548,11 +1548,13 @@ void rtw_core_stop(struct rtw_dev *rtwdev)
 
 	clear_bit(RTW_FLAG_RUNNING, rtwdev->flags);
 	clear_bit(RTW_FLAG_FW_RUNNING, rtwdev->flags);
+	rtwdev->csa_vif = NULL;
 
 	mutex_unlock(&rtwdev->mutex);
 
 	cancel_work_sync(&rtwdev->c2h_work);
 	cancel_work_sync(&rtwdev->update_beacon_work);
+	cancel_delayed_work_sync(&rtwdev->csa_beacon_work);
 	cancel_delayed_work_sync(&rtwdev->watch_dog_work);
 	cancel_delayed_work_sync(&coex->bt_relink_work);
 	cancel_delayed_work_sync(&coex->bt_reenable_work);
@@ -1565,6 +1567,9 @@ void rtw_core_stop(struct rtw_dev *rtwdev)
 
 	mutex_lock(&rtwdev->mutex);
 
+	rtwdev->csa_vif = NULL;
+	cancel_delayed_work(&rtwdev->csa_beacon_work);
+
 	rtwdev->chip->ops->power_off(rtwdev);
 }
 
@@ -2168,6 +2173,7 @@ int rtw_core_init(struct rtw_dev *rtwdev)
 	INIT_WORK(&rtwdev->ips_work, rtw_ips_work);
 	INIT_WORK(&rtwdev->fw_recovery_work, rtw_fw_recovery_work);
 	INIT_WORK(&rtwdev->update_beacon_work, rtw_fw_update_beacon_work);
+	INIT_DELAYED_WORK(&rtwdev->csa_beacon_work, rtw_fw_csa_beacon_work);
 	INIT_WORK(&rtwdev->ba_work, rtw_txq_ba_work);
 	skb_queue_head_init(&rtwdev->c2h_queue);
 	skb_queue_head_init(&rtwdev->coex.queue);
@@ -2291,7 +2297,8 @@ int rtw_register_hw(struct rtw_dev *rtwdev, struct ieee80211_hw *hw)
 	hw->wiphy->available_antennas_rx = hal->antenna_rx;
 
 	hw->wiphy->flags |= WIPHY_FLAG_SUPPORTS_TDLS |
-			    WIPHY_FLAG_TDLS_EXTERNAL_SETUP;
+			    WIPHY_FLAG_TDLS_EXTERNAL_SETUP |
+			    WIPHY_FLAG_HAS_CHANNEL_SWITCH;
 
 	hw->wiphy->features |= NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
 	hw->wiphy->max_scan_ssids = RTW_SCAN_MAX_SSIDS;
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index 6ecbeb4ffe4b..5d18841a705f 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -2094,6 +2094,9 @@ struct rtw_dev {
 	struct work_struct ips_work;
 	struct work_struct fw_recovery_work;
 	struct work_struct update_beacon_work;
+	struct delayed_work csa_beacon_work;
+	struct ieee80211_vif *csa_vif;
+	ktime_t csa_due;
 
 	/* used to protect txqs list */
 	spinlock_t txq_lock;
-- 
2.56.0

