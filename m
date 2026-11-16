Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813598;
	b=s4EsUuuXw2eTw6RQarl3YSMtT+Vu7gfoThV87jX3ImYL+uGLpSMYbMLxUfVnMwbBBf3h
	 2te5Zr0C9Lu5y50WbVKVh7gFcmbujCFk2ro5YjIBhaBl0Fanl61bSZFwmm1mZuMQSjlcR
	 SMWESF+sjJOU4PeT0DFxipsoFwhtGxnTRBdao2PlkEsSgYiLB308qBaSKhPfws7VyeE5x
	 xiZyKiwV6Cn39zYcBYuVT0LIcsAvVnxjSJO5pDNfgz0/2jX+JrqfRMnfPCAVIcucmkeQf
	 Rp64DO5bu6/vVoouzyiPq7xmPegqTio3ygwld5QUkXEqfXhBm2ntRbYUOctghHuFMYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pSqavgRGuQLOmg+/olwbXkfq/3BJB1gX1C4U/SdhezE=;
	b=F/HduQn3uXhkt4Z+oBvAGaLja/F81WODSxTpBhoZmY4XHu3j6Buf8jgTby3lRYBCYQ/i
	 Ue9kp04QSwqVU5X3+DtaMZ6PQlV7ZuaDS1p4cck0iSwtGFZuF/j8V2D5Awb7VI2gcYLXU
	 ecrG4T8jAhlXk51r6trtpITOsYAbsCHl3usXczgvgEO8X9WaosGjx+aqw2LyzvHMBtLlv
	 SXJiNMS+zMiRGmvye9AVn0Jfwi5pCRzUQIMe/xa5vAzeDGQ1BjRbxOkXK7K2Vokb6wyJV
	 aNsfuVqvwtkNz+tNJSdDggD3BQc6StBtkRFCT+qXYypPjZC6cW82uNcDgwsn6ByAWPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b1vSFMy+;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37B7606A885
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 07:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F37B7606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b1vSFMy+
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1555429f8f.2
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 23:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794813596; x=1795418396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSqavgRGuQLOmg+/olwbXkfq/3BJB1gX1C4U/SdhezE=;
        b=b1vSFMy+cczrTzsrCfMb3MhyJY/8gm/uegUcaQm2yJrgqdB15k5XFZZ9xcsrBVap95
         XNsyhu3oPtssxLZPGQ0t5Z42gN8eSshW30xIyD1HzeWWxQxTNbl4LBBwvqwtiYNVUq2w
         N9R1Ifg2XvHMaWwbGIqaaVkiuEmG53snBJfi4IA7kcvK05RBLIK4BsoI1TbOqubFXZQQ
         Wk2eYUE4RQNYbq/coQKQ4LG72PPuTT5waCk4EoJ8zDQCbAPGmAZfeSCibsjruo/j5fIl
         cwHrVP+ckuYshGZf5lqyWhqHRzYn5ivOh183U+I5D/wc1Gglv+UdzpNKMk0lusUimB6n
         MpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813596; x=1795418396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pSqavgRGuQLOmg+/olwbXkfq/3BJB1gX1C4U/SdhezE=;
        b=yvep7bhIqJd4VUtV7bYBPFddArPqZdmluBkPkQwDGAO5eQj5Zau61C/s7ZCOXLDELu
         Pv4mz9GffKZhgHKnw9fOAMT1jNwepoxRxuE3Kn20M4rhAc4TXeTTFMtGZcktL16tQP6J
         c5+S1xcD1wvnzlnHkg0bE3WXdNhEW48WiIx5RNHGh1F1NNzmNKUONlaCFzfYa85lm6TR
         4FvUi8pxMO34ZuRax2sojrZg7XvHZcWliJn8V106mPku+acf2iAZf+mZEtUHWlnmvEaZ
         P3CfKUqhXhI2Mm43Ws22hGIL8nrBhNyPYcujdJequOZQ2mHUUb57GWkNOAzAUUs6yZCe
         OFQQ==
X-Forwarded-Encrypted: i=1; AL+hErGFuT2CymFiOqVRU7JoGZfzKECq6so5k+UwHiE5M3cPi+8TQSAIweiPoMIXXuXtqZR++Ca807DsTtkS/oaAlQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8aUhJfXUSg1qMqKne4eXnIKruG8d6YKf5z08H/QTloqJAUHVS7
	juKarfKndZ39A/DeRS4fnHdxdNS7RuNhZ9oA0F4klufTG9Z+9q+s+SWl
X-Gm-Gg: AYBFou0iXroZ9NzI3JiGjpdbIwpN9QIy8J0I1rbuEHiSWu8m5RxeUqs+yWELn9O3Czq
	wlxJofs6P3dy/XRwnuQOdJgTCF92ZXnXyPETnpu+L9RsosXQO3AC2HHo67B6JXmHG+CfTobbUKB
	aYtTyLmDjGjRhAwDpXmTidrpNuS/OaMQjyaSXD7tooBQk4EB/jhcL72ZzK9VybOU2FteD7jDUA0
	nseKcMTu79Fi2PRQU3mf/waS9LVOVzZve6zcGfgxIUm7woMgfoY5UyECs9nBs1+O2DkJMybyw6M
	sdCOTOXwNBQGc6LYH2ZkSUlGh6tYrBrmmVJ+hjCD2hpgyFh/3qAfUsvv7+4FfauUwISuHUBR2Jh
	geWmCJNG4fhO7MB3X6BttPDQf1dWjOgY1sDYGE1Pgaxfhq2WySdXqgNNNxLe435aauRdtl16eKR
	OTq+QWSytPWpSzLx5CPKrHwwRqzQWHcOiasys16sMskhKeNzFA6SIHwdZKfVCgrO0EESHgnx1or
	lhMEV5SR9eBWSJxrNG1fYCtP34QDnf+wHB/Luve9fvYEE89AWOZPJkNETBBtu2vw7EVTaO1fm7n
	xQjWErz3TUzjena+6wIiaTY6d+dMzfoSr1M=
X-Received: by 2002:a5d:5f56:0:b0:48d:f36e:fbcb with SMTP id ffacd0b85a97d-49c70ed9069mr24385639f8f.14.1794813596403;
        Sun, 15 Nov 2026 23:19:56 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1968sm20756980f8f.10.2026.11.15.23.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:19:55 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v11 2/3] wifi: rtw88: support channel switch in AP mode
Date: Mon, 16 Nov 2026 08:19:51 +0100
Message-ID: <20261116071952.1142013-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116071952.1142013-1-mehmet.fide@gmail.com>
References: <20261116071952.1142013-1-mehmet.fide@gmail.com>
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

Declare WIPHY_FLAG_HAS_CHANNEL_SWITCH and start the countdown when
BSS_CHANGED_BEACON brings a beacon with CSA: the firmware repeats the
beacon held in the first reserved page, so while a switch is announced
the page is downloaded again every beacon interval to advance the
countdown, and ieee80211_csa_finish() is called once it completes. IBSS
shares the page and the work.

The work is a delayed work of the device and csa_vif names the
interface, both under the driver mutex. The countdown is cancelled when
the AP stops, when the interface goes away, on WoWLAN suspend and in
rtw_core_stop(), and is not started while the device is stopped; the
BSS_CHANGED_BEACON replay after a hardware restart resumes it, and so
does the driver after a WoWLAN resume, which mac80211 follows with no
replay.

Only the work advances the count: while a switch is announced the
beacon of the page is fetched as a template, which leaves the count as
it is, and the work steps it before each of its downloads. A download
for another reason, the replay after a hardware restart or the page of
the WoWLAN firmware, then repeats the count that is on the air. The
TIM update, the PG backup and the download on association are left to
the work during a countdown, its next download carries their changes.
An AP that stops in its countdown downloads the page once more if a
station interface stays behind. A scan is refused: it would take the
AP off the channel its stations count down to.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/net/wireless/realtek/rtw88/fw.c       | 95 ++++++++++++++++++-
 drivers/net/wireless/realtek/rtw88/fw.h       |  4 +
 drivers/net/wireless/realtek/rtw88/mac80211.c | 49 ++++++++--
 drivers/net/wireless/realtek/rtw88/main.c     |  9 +-
 drivers/net/wireless/realtek/rtw88/main.h     |  3 +
 5 files changed, 150 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 3cd17a3bb494..6968b608c54f 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -1229,6 +1229,7 @@ static struct sk_buff *rtw_get_rsvd_page_skb(struct ieee80211_hw *hw,
 	struct ieee80211_vif *vif;
 	struct rtw_vif *rtwvif;
 	struct sk_buff *skb_new;
+	struct ieee80211_mutable_offsets offs = {};
 	struct cfg80211_ssid *ssid;
 	u16 tim_offset = 0;
 
@@ -1249,7 +1250,15 @@ static struct sk_buff *rtw_get_rsvd_page_skb(struct ieee80211_hw *hw,
 
 	switch (rsvd_pkt->type) {
 	case RSVD_BEACON:
-		skb_new = ieee80211_beacon_get_tim(hw, vif, &tim_offset, NULL, 0);
+		/* only the countdown work advances the count */
+		if (vif->bss_conf.csa_active) {
+			skb_new = ieee80211_beacon_get_template(hw, vif, &offs,
+								0);
+			tim_offset = offs.tim_offset;
+		} else {
+			skb_new = ieee80211_beacon_get_tim(hw, vif, &tim_offset,
+							   NULL, 0);
+		}
 		rsvd_pkt->tim_offset = tim_offset;
 		break;
 	case RSVD_PS_POLL:
@@ -1802,14 +1811,94 @@ int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev)
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
+	if (rtwdev->csa_vif == vif ||
+	    !test_bit(RTW_FLAG_RUNNING, rtwdev->flags))
+		return;
+
+	rtwdev->csa_vif = vif;
+	rtwdev->csa_due = ktime_get();
+	rtw_fw_csa_queue(rtwdev, vif);
+}
+
+bool rtw_fw_csa_stop(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
+{
+	lockdep_assert_held(&rtwdev->mutex);
+
+	if (!vif || rtwdev->csa_vif != vif)
+		return false;
+
+	rtwdev->csa_vif = NULL;
+	cancel_delayed_work(&rtwdev->csa_beacon_work);
+
+	return true;
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
+	/* the countdown's next download carries the TIM */
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
+		ieee80211_beacon_update_cntdwn(vif, 0);
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
index 48ad9ceab6ea..40686a7e47d4 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.h
+++ b/drivers/net/wireless/realtek/rtw88/fw.h
@@ -863,7 +863,11 @@ void rtw_add_rsvd_page_pno(struct rtw_dev *rtwdev,
 void rtw_add_rsvd_page_sta(struct rtw_dev *rtwdev,
 			   struct rtw_vif *rtwvif);
 int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev);
+bool rtw_fw_csa_active(struct rtw_dev *rtwdev);
+void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif);
+bool rtw_fw_csa_stop(struct rtw_dev *rtwdev, struct ieee80211_vif *vif);
 void rtw_fw_update_beacon_work(struct work_struct *work);
+void rtw_fw_csa_beacon_work(struct work_struct *work);
 void rtw_send_rsvd_page_h2c(struct rtw_dev *rtwdev);
 int rtw_dump_drv_rsvd_page(struct rtw_dev *rtwdev,
 			   u32 offset, u32 size, u32 *buf);
diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 5e40cf06a9e3..4bf47116ac73 100644
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
@@ -438,6 +443,14 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 		rtw_set_dtim_period(rtwdev, conf->dtim_period);
 		rtw_fw_download_rsvd_page(rtwdev);
 		rtw_send_rsvd_page_h2c(rtwdev);
+		/*
+		 * A beacon with CSA starts the countdown, also when a restart
+		 * replays it. A beacon without CSA ends it.
+		 */
+		if (conf->csa_active)
+			rtw_fw_csa_start(rtwdev, vif);
+		else
+			rtw_fw_csa_stop(rtwdev, vif);
 	}
 
 	if (changed & BSS_CHANGED_BEACON_ENABLED) {
@@ -488,13 +501,20 @@ static void rtw_ops_stop_ap(struct ieee80211_hw *hw,
 			    struct ieee80211_bss_conf *link_conf)
 {
 	struct rtw_dev *rtwdev = hw->priv;
+	bool csa;
 
 	mutex_lock(&rtwdev->mutex);
+	csa = rtw_fw_csa_stop(rtwdev, vif);
 	rtw_write32_clr(rtwdev, REG_TCR, BIT_TCR_UPDATE_HGQMD);
 	rtw_write16(rtwdev, REG_ATIMWND, ATIMWND_DEFAULT);
 	rtwdev->ap_active = false;
-	if (!rtw_core_check_sta_active(rtwdev))
+	if (!rtw_core_check_sta_active(rtwdev)) {
 		rtw_clear_op_chan(rtwdev);
+	} else if (csa) {
+		/* what the countdown held back */
+		rtw_fw_download_rsvd_page(rtwdev);
+		rtw_send_rsvd_page_h2c(rtwdev);
+	}
 	mutex_unlock(&rtwdev->mutex);
 }
 
@@ -626,7 +646,8 @@ static int rtw_ops_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	}
 
 	/* download new cam settings for PG to backup */
-	if (rtw_get_lps_deep_mode(rtwdev) == LPS_DEEP_MODE_PG)
+	if (rtw_get_lps_deep_mode(rtwdev) == LPS_DEEP_MODE_PG &&
+	    !rtw_fw_csa_active(rtwdev))
 		rtw_fw_download_rsvd_page(rtwdev);
 
 out:
@@ -846,6 +867,7 @@ static int rtw_ops_suspend(struct ieee80211_hw *hw,
 	int ret;
 
 	mutex_lock(&rtwdev->mutex);
+	rtw_fw_csa_stop(rtwdev, rtwdev->csa_vif);
 	ret = rtw_wow_suspend(rtwdev, wowlan);
 	if (ret)
 		rtw_err(rtwdev, "failed to suspend for wow %d\n", ret);
@@ -854,6 +876,15 @@ static int rtw_ops_suspend(struct ieee80211_hw *hw,
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
@@ -863,6 +894,8 @@ static int rtw_ops_resume(struct ieee80211_hw *hw)
 	ret = rtw_wow_resume(rtwdev);
 	if (ret)
 		rtw_err(rtwdev, "failed to resume for wow %d\n", ret);
+	else
+		rtw_iterate_vifs(rtwdev, rtw_ops_csa_resume_iter, rtwdev);
 	mutex_unlock(&rtwdev->mutex);
 
 	return ret ? 1 : 0;
@@ -893,20 +926,24 @@ static int rtw_ops_hw_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
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

