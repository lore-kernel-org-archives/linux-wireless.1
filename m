Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043986;
	b=VRvEieurye+KoENWQgbyFT1+BsLjJhqQYSNvxu9YkJ81NAOadfkg1nc5fejN9yearj1Q
	 Oh3OKOJ/1wp5d/JGChLfT0TiPdw/40TqPilBtUbR5wWiZeYOesox4GylzUG+AlvcNXY0o
	 U3xtiit/yUq/DLcYXtCGW/YEM06Y5afj6h/jn4sXXSd3500SC/YF5HjkbsaoWzynqO4uL
	 NaQgTuhUH0IecIQXf5FmCQ8N4SbmOWzNPVpXVE0AZgf2ESm07HKvhUaCWCEmhkKAj97b7
	 ZoMUdMAb4IyeafIRsDms6ZlTDx73+/ThQmtd49gFHfsbhVScQXKNVhVq9yL+4i6y2gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kPvKw0301ieQAlMXppdOagHZm6GF8lfDDVzHCZ+vpTY=;
	b=Aio7C8fy7/lB/e/apIx+N0sIfX/lDos8Rp4Y41+QT4zH+bfgEHbKEfLAQ8tZGYrQhQVG
	 6IVfKDifIu9UypYQz2OoJoHSBkipioE16NtL4hkXUd/ehA9ErqlKW6nwvu7fDjAC7Jg0D
	 Mv5hw6LoEqcI87srlDipZfZVdvQLBzdrYjS5o8knTBaxjBcx4qNttRgaXKdQU0x29stXj
	 VKe7XbyaUkIjAd4SpGeY8cgA0sb/meIt90W6Elh2nG9RI4YzFipGzkI2vjkZHLM+N9gte
	 NKGADcjDrJOpa9uNcK/ZjMxtkJUqBTszChOYvHc3IAuA5cOv3j8H+DcgrK+jbdwA0Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h6EqUezo;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1A660A2603
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 23:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F1A660A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h6EqUezo
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so13089985e9.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 15:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795043984; x=1795648784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kPvKw0301ieQAlMXppdOagHZm6GF8lfDDVzHCZ+vpTY=;
        b=h6EqUezoeWcvHGIqAxXyYdMMrwEZgxZaOtxsR25QxEligTM8MaK2kY6S8lyjMADVBj
         pXJpF2mzBjN9g51mGWfxBFngkpuXgDsHWQ4/GaeFXRnH1URRXwgc/qSwdYVeDDlJ1dRK
         DYtTRKIZprazbLEVEmsClR98Wngf1aLKycoRoz2FCPqojfLjEbBU5lou/XAOk9XJPkD6
         vjvtJzeiZakbu+oWvkN28XMje13bNg5Di9VLyR0HNA8lTH2Gwi8M8bIdnpUXXB1S1ilL
         ycVN9QJUj7mIoMgENzPK426Ilt3o3Y9BDxz3yeKqk+Y6HQgR3XgtcSUpBnvE+rbedOvq
         /kvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043984; x=1795648784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kPvKw0301ieQAlMXppdOagHZm6GF8lfDDVzHCZ+vpTY=;
        b=Zz/2TpQIiLcgb+oJWM78unz9GXdFtUL+ftHRMsZHso/M+BW4MaUpw4pxrUnZkO/2di
         em8ArOgXAGbm4iLwrH7rStcN7GS9jzvOo1OT+eP6BBuYhPHypZUqOSs2R4+41SOdE+xA
         jblbCaIOH3kWyur6836O9xQs3C+Uu84L8VglqP9zqbEhAWUFzSX8Dp+MyMDasu+t60iM
         zJlSBBEZ4DkOrQygH1wWySgAH4yNX3/aK8tVpgRt+Hj09z9RPBa6hpKRdGCacw3m+Lto
         BlI6zX5qPPW67ylJNM4DjNJZVa7f+1CxS2dUr9olnuij3aN1BIOUkN/okkyg6M9as8rU
         kX/Q==
X-Forwarded-Encrypted: i=1; AL+hErEWc788mdMnXBaV7BWTpG7m3weo0tgYo7mzVIGo2DD8C3xf4QEuoWGUdOzdo94k8Rxzw4wVCXzDXNa8S9Vt/A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9KHtoC4c0dZojVbRP6Mx8Mops6boSj4lkpd6/xEnemh/Khy4hW
	ud7n0E9OXxXIz2d+8mw5rXtgXtwRnieoDQCOBi2E7rO5YAHkbuIWA9bVcg2W/vca
X-Gm-Gg: AYBFou0blGhTmoDzL6wVDuy0Rf+lY9RuK62fJieyRlNKUZSTyndHS4dV/jMoCQWKVC/
	rWphkAAp85ym7aiTSMeiJiWU5WhKjeNNb+SDGkmhY7HYBMopdvcOamKHso57l4ZiL6qnhDLKWow
	uN2axzpUK1aiD+tC9XJoV2wmzAS5LyG3tjH7y8SxWhT6gpkWMG/Sfx93zfzXolSFfn6MwzC0HZG
	Ab5ZUFEcaDi/2j6S2DeBtHXnWKy/4l5n4DJ7wiPkN6x6EKHIDwYqB76D+HX6MFu/vlFDQAArF5B
	fRT+FuRhHsf7iXw1FOaLuD+aJyRkG5/4i5cvqNP70vchSPzZmRzWqcxDm6uJaFcT0fGm3K/7fhU
	lwnrjV6FxMTwz++LFocPIIt7lb5Y5XnqplvoFRnlxTB8aw2CcLafObvPQb298qTj7HmFIxpJNR0
	3TltN36r0XiU5PaVvnoy7veouWW6Hc8/oeSPA0twdtS4mPyg3gk1DXW++wn7WGG1CFWfoEAeQKP
	hfjR3pdTKdT81yRG6IAIZ8bCC+lY1d/gQF3mUYyfu5cyzQ1xqc/HLGZDzz2f0ySPZMdoGr1vs6I
	eCr5EaeUS2AtXHGtPTnu1rOSc6T8ZQxj1WiUAoXi14GfEgCtuONvq4Yb
X-Received: by 2002:a05:600c:524d:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4bb7da46634mr83114965e9.30.1795043983591;
        Wed, 18 Nov 2026 15:19:43 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb842f9348sm5966095e9.8.2026.11.18.15.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:19:43 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v13 2/3] wifi: rtw88: support channel switch in AP mode
Date: Thu, 19 Nov 2026 00:19:39 +0100
Message-ID: <20261118231940.3950-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118231940.3950-1-mehmet.fide@gmail.com>
References: <20261118231940.3950-1-mehmet.fide@gmail.com>
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
countdown. The work steps the count with ieee80211_beacon_update_cntdwn()
and calls ieee80211_csa_finish() one beacon interval after the count of
1 was downloaded; a download that fails is repeated with the same count,
so the switch does not complete before its last count was handed to the
firmware. IBSS shares the page and the work.

The work is a delayed work of the device and csa_vif names the
interface, both under the driver mutex. The driver clears csa_vif, the
work never does: the countdown is cancelled when the AP stops, when the
interface goes away, on WoWLAN suspend and in rtw_core_stop(), and while
beaconing is disabled, as for an IBSS that is left or for an off-channel
period; it starts again when beaconing is enabled with the switch still
announced. It is not started while the device is stopped. The work
itself only stops, at the end of the countdown or once mac80211 has
taken the beacon away. The BSS_CHANGED_BEACON replay after a hardware
restart resumes the countdown, a failed download of the replay is
repeated before the next step, and the driver resumes the countdown
after a WoWLAN resume, which mac80211 follows with no replay.

While a switch is announced the beacon of the page is fetched as a
template, which leaves the count as it is, so a download for another
reason, the replay after a hardware restart or the page of the WoWLAN
firmware, carries the count as the work left it. The TIM update, the PG
backup and the download on association are left to the work during a
countdown, its next download carries their changes. An AP that stops
downloads the page once more if a station interface stays behind. A
scan is refused: it would take the AP off the channel its stations
count down to.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/net/wireless/realtek/rtw88/fw.c       | 100 +++++++++++++++++-
 drivers/net/wireless/realtek/rtw88/fw.h       |   5 +
 drivers/net/wireless/realtek/rtw88/mac80211.c |  55 ++++++++--
 drivers/net/wireless/realtek/rtw88/main.c     |   9 +-
 drivers/net/wireless/realtek/rtw88/main.h     |   6 ++
 5 files changed, 164 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index e0f3e1adb13f..9d5df3e65b97 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -1229,6 +1229,7 @@ static struct sk_buff *rtw_lps_pg_info_get(struct ieee80211_hw *hw)
 static struct sk_buff *rtw_get_rsvd_page_skb(struct ieee80211_hw *hw,
 					     struct rtw_rsvd_page *rsvd_pkt)
 {
+	struct ieee80211_mutable_offsets offs = {};
 	struct ieee80211_vif *vif;
 	struct rtw_vif *rtwvif;
 	struct sk_buff *skb_new;
@@ -1252,7 +1253,15 @@ static struct sk_buff *rtw_get_rsvd_page_skb(struct ieee80211_hw *hw,
 
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
@@ -1808,14 +1817,99 @@ int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev)
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
+void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
+		      bool retry)
+{
+	lockdep_assert_held(&rtwdev->mutex);
+
+	if (rtwdev->csa_vif == vif ||
+	    !test_bit(RTW_FLAG_RUNNING, rtwdev->flags))
+		return;
+
+	rtwdev->csa_vif = vif;
+	rtwdev->csa_retry = retry;
+	rtwdev->csa_count = ieee80211_beacon_cntdwn_is_complete(vif, 0) ? 1 : 0;
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
+	u8 count;
+
+	mutex_lock(&rtwdev->mutex);
+
+	vif = rtwdev->csa_vif;
+	if (!vif || !vif->bss_conf.csa_active)
+		goto out;
+
+	if (!rtwdev->csa_retry) {
+		if (rtwdev->csa_count == 1) {
+			ieee80211_csa_finish(vif, 0);
+			goto out;
+		}
+
+		count = ieee80211_beacon_update_cntdwn(vif, 0);
+		if (!count)
+			goto out;
+		rtwdev->csa_count = count;
+	}
+
+	rtwdev->csa_retry = !!rtw_fw_download_rsvd_page(rtwdev);
+	if (!rtwdev->csa_retry)
+		rtw_send_rsvd_page_h2c(rtwdev);
+	rtw_fw_csa_queue(rtwdev, vif);
+
+out:
 	mutex_unlock(&rtwdev->mutex);
 }
 
diff --git a/drivers/net/wireless/realtek/rtw88/fw.h b/drivers/net/wireless/realtek/rtw88/fw.h
index 48ad9ceab6ea..14bcddbd786d 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.h
+++ b/drivers/net/wireless/realtek/rtw88/fw.h
@@ -863,7 +863,12 @@ void rtw_add_rsvd_page_pno(struct rtw_dev *rtwdev,
 void rtw_add_rsvd_page_sta(struct rtw_dev *rtwdev,
 			   struct rtw_vif *rtwvif);
 int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev);
+bool rtw_fw_csa_active(struct rtw_dev *rtwdev);
+void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
+		      bool retry);
+void rtw_fw_csa_stop(struct rtw_dev *rtwdev, struct ieee80211_vif *vif);
 void rtw_fw_update_beacon_work(struct work_struct *work);
+void rtw_fw_csa_beacon_work(struct work_struct *work);
 void rtw_send_rsvd_page_h2c(struct rtw_dev *rtwdev);
 int rtw_dump_drv_rsvd_page(struct rtw_dev *rtwdev,
 			   u32 offset, u32 size, u32 *buf);
diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 3029fbdb288a..c9ac2685437e 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -240,6 +240,10 @@ static void rtw_ops_remove_interface(struct ieee80211_hw *hw,
 
 	mutex_lock(&rtwdev->mutex);
 
+	rtw_fw_csa_stop(rtwdev, vif);
+	if (rtwdev->csa_wow_vif == vif)
+		rtwdev->csa_wow_vif = NULL;
+
 	rtw_leave_lps_deep(rtwdev);
 
 	rtw_txq_cleanup(rtwdev, vif->txq);
@@ -388,6 +392,7 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 	struct rtw_coex *coex = &rtwdev->coex;
 	struct rtw_coex_stat *coex_stat = &coex->stat;
 	u32 config = 0;
+	int ret;
 
 	mutex_lock(&rtwdev->mutex);
 
@@ -398,8 +403,11 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
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
@@ -444,8 +452,16 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_BEACON) {
 		rtw_set_dtim_period(rtwdev, conf->dtim_period);
-		rtw_fw_download_rsvd_page(rtwdev);
+		ret = rtw_fw_download_rsvd_page(rtwdev);
 		rtw_send_rsvd_page_h2c(rtwdev);
+		/*
+		 * A beacon with CSA starts the countdown, also when a restart
+		 * replays it. A beacon without CSA ends it.
+		 */
+		if (conf->csa_active)
+			rtw_fw_csa_start(rtwdev, vif, !!ret);
+		else
+			rtw_fw_csa_stop(rtwdev, vif);
 	}
 
 	if (changed & BSS_CHANGED_BEACON_ENABLED) {
@@ -455,6 +471,10 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 		else
 			rtw_write32_clr(rtwdev, REG_FWHW_TXQ_CTRL,
 					BIT_EN_BCNQ_DL);
+		if (!conf->enable_beacon)
+			rtw_fw_csa_stop(rtwdev, vif);
+		else if (conf->csa_active)
+			rtw_fw_csa_start(rtwdev, vif, rtwdev->csa_retry);
 	}
 	if (changed & BSS_CHANGED_CQM)
 		rtw_fw_beacon_filter_config(rtwdev, true, vif);
@@ -498,11 +518,17 @@ static void rtw_ops_stop_ap(struct ieee80211_hw *hw,
 	struct rtw_dev *rtwdev = hw->priv;
 
 	mutex_lock(&rtwdev->mutex);
+	rtw_fw_csa_stop(rtwdev, vif);
 	rtw_write32_clr(rtwdev, REG_TCR, BIT_TCR_UPDATE_HGQMD);
 	rtw_write16(rtwdev, REG_ATIMWND, ATIMWND_DEFAULT);
 	rtwdev->ap_active = false;
-	if (!rtw_core_check_sta_active(rtwdev))
+	if (!rtw_core_check_sta_active(rtwdev)) {
 		rtw_clear_op_chan(rtwdev);
+	} else {
+		/* what a countdown may have held back */
+		rtw_fw_download_rsvd_page(rtwdev);
+		rtw_send_rsvd_page_h2c(rtwdev);
+	}
 	mutex_unlock(&rtwdev->mutex);
 }
 
@@ -634,7 +660,8 @@ static int rtw_ops_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	}
 
 	/* download new cam settings for PG to backup */
-	if (rtw_get_lps_deep_mode(rtwdev) == LPS_DEEP_MODE_PG)
+	if (rtw_get_lps_deep_mode(rtwdev) == LPS_DEEP_MODE_PG &&
+	    !rtw_fw_csa_active(rtwdev))
 		rtw_fw_download_rsvd_page(rtwdev);
 
 out:
@@ -851,12 +878,16 @@ static int rtw_ops_suspend(struct ieee80211_hw *hw,
 			   struct cfg80211_wowlan *wowlan)
 {
 	struct rtw_dev *rtwdev = hw->priv;
+	struct ieee80211_vif *csa_vif;
 	int ret;
 
 	mutex_lock(&rtwdev->mutex);
+	csa_vif = rtwdev->csa_vif;
+	rtw_fw_csa_stop(rtwdev, csa_vif);
 	ret = rtw_wow_suspend(rtwdev, wowlan);
 	if (ret)
 		rtw_err(rtwdev, "failed to suspend for wow %d\n", ret);
+	rtwdev->csa_wow_vif = ret ? NULL : csa_vif;
 	mutex_unlock(&rtwdev->mutex);
 
 	return ret ? 1 : 0;
@@ -865,12 +896,18 @@ static int rtw_ops_suspend(struct ieee80211_hw *hw,
 static int rtw_ops_resume(struct ieee80211_hw *hw)
 {
 	struct rtw_dev *rtwdev = hw->priv;
+	struct ieee80211_vif *csa_vif;
 	int ret;
 
 	mutex_lock(&rtwdev->mutex);
 	ret = rtw_wow_resume(rtwdev);
 	if (ret)
 		rtw_err(rtwdev, "failed to resume for wow %d\n", ret);
+	csa_vif = rtwdev->csa_wow_vif;
+	rtwdev->csa_wow_vif = NULL;
+	if (!ret && csa_vif && csa_vif->bss_conf.csa_active &&
+	    csa_vif->bss_conf.enable_beacon)
+		rtw_fw_csa_start(rtwdev, csa_vif, false);
 	mutex_unlock(&rtwdev->mutex);
 
 	return ret ? 1 : 0;
@@ -901,20 +938,24 @@ static int rtw_ops_hw_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
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
index 48abf0daf402..38bf6100a0dd 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1557,11 +1557,13 @@ void rtw_core_stop(struct rtw_dev *rtwdev)
 
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
@@ -1574,6 +1576,9 @@ void rtw_core_stop(struct rtw_dev *rtwdev)
 
 	mutex_lock(&rtwdev->mutex);
 
+	rtwdev->csa_vif = NULL;
+	cancel_delayed_work(&rtwdev->csa_beacon_work);
+
 	rtwdev->chip->ops->power_off(rtwdev);
 }
 
@@ -2177,6 +2182,7 @@ int rtw_core_init(struct rtw_dev *rtwdev)
 	INIT_WORK(&rtwdev->ips_work, rtw_ips_work);
 	INIT_WORK(&rtwdev->fw_recovery_work, rtw_fw_recovery_work);
 	INIT_WORK(&rtwdev->update_beacon_work, rtw_fw_update_beacon_work);
+	INIT_DELAYED_WORK(&rtwdev->csa_beacon_work, rtw_fw_csa_beacon_work);
 	INIT_WORK(&rtwdev->ba_work, rtw_txq_ba_work);
 	skb_queue_head_init(&rtwdev->c2h_queue);
 	skb_queue_head_init(&rtwdev->coex.queue);
@@ -2297,7 +2303,8 @@ int rtw_register_hw(struct rtw_dev *rtwdev, struct ieee80211_hw *hw)
 	hw->wiphy->available_antennas_rx = hal->antenna_rx;
 
 	hw->wiphy->flags |= WIPHY_FLAG_SUPPORTS_TDLS |
-			    WIPHY_FLAG_TDLS_EXTERNAL_SETUP;
+			    WIPHY_FLAG_TDLS_EXTERNAL_SETUP |
+			    WIPHY_FLAG_HAS_CHANNEL_SWITCH;
 
 	hw->wiphy->features |= NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
 	hw->wiphy->max_scan_ssids = RTW_SCAN_MAX_SSIDS;
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index 6034187ed29e..0444fd46028e 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -2095,6 +2095,12 @@ struct rtw_dev {
 	struct work_struct ips_work;
 	struct work_struct fw_recovery_work;
 	struct work_struct update_beacon_work;
+	struct delayed_work csa_beacon_work;
+	struct ieee80211_vif *csa_vif;
+	struct ieee80211_vif *csa_wow_vif;
+	ktime_t csa_due;
+	u8 csa_count;
+	bool csa_retry;
 
 	/* used to protect txqs list */
 	spinlock_t txq_lock;
-- 
2.56.0

