Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289812;
	b=kj7lS50c9qTL5snYVExLdqM5+pHCvoAxWm5STUQ6Uqt0A5nm8Fc8y0qQ0ypU/rgwIK1+
	 gvLj6x1x1oz2zBupJAY0iah5m0EOvTT4iHFFKgMHXAefGmUjHy/zCiDImim0GXHJRegAO
	 ssUwkplR14SQt3KJHydUdMQ+IPZ388xy+ndXrK9jb9DNTxWurT0LqoPsG6O0RfcEVzLHO
	 DNRyXaxhF6krpWokcdGY39uuZeh7GN+cQY4WFtTisTpYTyPylMBNms2lArhn8/AybqxU2
	 OQWVApjbVdI+VvUp5ndVkwabsU+drCWd5qyumJ77Pk+WPQFdyi4gUrlnQkmmg2cn/dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zzJ9XzBzvnJgmQM5n8Kg/7rWvUv4dChaD9XdRMh6PL0=;
	b=xGPW8QyrN0HNqLum3nWyrRiTW9Ec7VD5f6UF44+0ERdrlTkssOilVpb9AOUVw1FPAN78
	 +5pzLLtZyNExFWCxaMNQqJBoyhHDDGkCBEc0NboaOf1mVjom6GXfu9J6lwa/X21dEboSO
	 OMVkO3VUTqbRyMXpxLjMTCRV9aAJymjiteD/UnxyuIpsZVKWOUeo8aDS7E9MmUiNst/AA
	 QpgzVNUc7dyvujZZMUgtDHcA8XYpSAYc71suolMla0avqOY2f6iaY9pEhanI78FC93lCA
	 LTztCxmh+bodTm/cXqysMttRp1UQ2JxmzpFdhKpZOxw9pLV5JlEww1Tqwu34CsCpThw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iVwUSdSk;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C3D606A682
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 19:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C3D606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iVwUSdSk
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-949680e6d83so194960085a.3
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 11:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795289811; x=1795894611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zzJ9XzBzvnJgmQM5n8Kg/7rWvUv4dChaD9XdRMh6PL0=;
        b=iVwUSdSk162KasYka3/10/wFS1acsh4a2noUGZ68sc7msW+4sQQdLkWrZwGS2ptr5d
         Ie2uOsIibXlSuKKKWrR2ocTQnE9fWU86HUMaqajjtvlHhfd7bgd3lW5PWcIe2BcC6FVq
         s6r2ue1zf0j8JjMFWFK+wfRdL8+Jk1ziEC5CTYpL+UhzFhu/5PSjnjoVc8rwK2idKWqQ
         WafQvwF3ciwqNSfqgTHRC1FMVrvglOxPKLNzQehQ4TdE6/8ujZmlZ7xcI4IfGMcuIRec
         jxVxcm55NP+AZ/WV8DCXDgpczYhLlPmAEoDVgewArqeqnmf5fk8DSryfKFRH04DU3kIt
         PpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795289811; x=1795894611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zzJ9XzBzvnJgmQM5n8Kg/7rWvUv4dChaD9XdRMh6PL0=;
        b=HtXbcnpEaA6YFTpzh04fIjSndEvA+eAG95vMdRqmyzMoy2UM0/srwqXj/WUKSPJijR
         sq5WDw+6casg4FWU+f4LnbeR9rfH6jXsbyP8qngfqnVqn/H/v5Wd2L6Kse3pyRO0KfEP
         ufaPxthPNye4c5bmRSW69An3qq4y8Wsjz8vfoNVS8L1s2pntzdKpPB+JFOUCw3+CHmjZ
         roIokDzenU/8lnBBEjuClhKgmjfSLOEc+VlyetqUQRT2VnPUYO/kG7UfDkFk9qdaiLuY
         IfSmcssNzK6+Dh75oEIIZiQe+4Sq6kjnqQ7OQOCikJt5CfKgE/iSr4k9m7TNm7fESQMZ
         nOZQ==
X-Forwarded-Encrypted: i=1; AL+hErFvVt7BP/4jaDsG1hQWASnBC1FlEzp8PTfsytR5cr3/xXxowouyNKnbVogJmtw5D/InKGbuVZJE1ZkDzYJDCQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+10kEveVygiyOxaxwDWI1rovDX7C4BW/kZuBTSB3JwJOhVrVET
	e1noZ8DQVi5IUbmcBoLWhehFuih1cuMXlfh+ZZmd5yCO1NVaPkbmlLG8
X-Gm-Gg: AZFdTZe9eXvjyAnGexk+63BjB0YTSb041UEl66PyGPepwZMndPAsU+dAe4MO7OnIh0J
	/xqx5eco8cgrVYraAm2TjDI4xkj+4MvFKvhz3pV49I0t5gjG4NCQv1YoKcoLfMUGtdSl/EysR/m
	dB5e7C1K+4a9/smnvw3b1+EOiE1GAmwDYMnjyDHnLSgWswhkfWjsqmYCoK2hQpMxR3juLgLkJiO
	Wuc8e1TCj/YspZrk8s5h1VwCNUVmDmC9w69zI29osbm2PnBHzbg4hIxlN5b5OwGznhK4Nq0U4ap
	O89hoITc4O3lN36JsqZhrocB8cPNzOzJgaYxo73w4mFHZPa2tTZre+jyPPW8cUAu8LF9cxDI9Uz
	z0Bp0SchVd3hppG8hyuywUoGV1mBcN1XFF3sCOr8/IIoUnhxd4NgHnYH7j7KfZAueMMB4V62yQ4
	tMuUtXUKEFgkPnCgeDdCrYQT83PjrH3NaEoTDs7mvyG9SnGzXk9rZafitmjLWjCTORY0p8uMlp/
	u4fWh+jO8ydARDeS2Zi2+4QWL74wWvZePDJwEUoGoltdZNQzqf5wcGvJp7VYWxmgp8xVLshNy4W
	8pf24xZBNGOIOaUrC+3fAbAilmj1wSlyvzE=
X-Received: by 2002:a05:620a:1992:b0:949:743e:9149 with SMTP id af79cd13be357-949ba8239bdmr1198568885a.6.1795289810592;
        Sat, 21 Nov 2026 11:36:50 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb427388sm466931785a.42.2026.11.21.11.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:36:50 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v14 2/3] wifi: rtw88: support channel switch in AP mode
Date: Sat, 21 Nov 2026 20:36:43 +0100
Message-ID: <20261121193644.603289-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121193644.603289-1-mehmet.fide@gmail.com>
References: <20261121193644.603289-1-mehmet.fide@gmail.com>
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

The driver does not set WIPHY_FLAG_HAS_CHANNEL_SWITCH, so hostapd's
CHAN_SWITCH is refused and an rtw88 AP can only change its channel by
restarting.

The firmware repeats the beacon of the first reserved page, so the
driver has to step the countdown. Set the flag, and when
BSS_CHANGED_BEACON brings a beacon with CSA, start a delayed work that
advances the count with ieee80211_beacon_update_cntdwn() and downloads
the page once per beacon interval. It calls ieee80211_csa_finish() one
interval after the count of 1 was downloaded, and repeats a failed
download with the same count. IBSS uses the same page and work.

The countdown stops when the AP stops, the interface is removed,
beaconing is disabled, on WoWLAN suspend and in rtw_core_stop(). It
starts again when beaconing is enabled, when a hardware restart replays
the beacon, and after a WoWLAN resume. csa_vif and the work are under
the driver mutex, and only the stop paths clear csa_vif.

During a countdown the page beacon is fetched with
ieee80211_beacon_get_template(), which leaves the count alone, so any
other download carries the current count. The TIM update, the PG backup
and the download on association are left to the next step. An AP that
stops with a station interface left downloads the page once more.
Scans are refused, as they would take the AP off its channel.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/net/wireless/realtek/rtw88/fw.c       | 97 ++++++++++++++++++-
 drivers/net/wireless/realtek/rtw88/fw.h       |  5 +
 drivers/net/wireless/realtek/rtw88/mac80211.c | 48 +++++++--
 drivers/net/wireless/realtek/rtw88/main.c     |  9 +-
 drivers/net/wireless/realtek/rtw88/main.h     |  6 ++
 5 files changed, 154 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 4575073d0149..059fe04014de 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -1226,6 +1226,7 @@ static struct sk_buff *rtw_lps_pg_info_get(struct ieee80211_hw *hw)
 static struct sk_buff *rtw_get_rsvd_page_skb(struct ieee80211_hw *hw,
 					     struct rtw_rsvd_page *rsvd_pkt)
 {
+	struct ieee80211_mutable_offsets offs = {};
 	struct ieee80211_vif *vif;
 	struct rtw_vif *rtwvif;
 	struct sk_buff *skb_new;
@@ -1249,7 +1250,14 @@ static struct sk_buff *rtw_get_rsvd_page_skb(struct ieee80211_hw *hw,
 
 	switch (rsvd_pkt->type) {
 	case RSVD_BEACON:
-		skb_new = ieee80211_beacon_get_tim(hw, vif, &tim_offset, NULL, 0);
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
@@ -1800,14 +1808,97 @@ int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev)
 	return ret;
 }
 
+bool rtw_fw_csa_active(struct rtw_dev *rtwdev)
+{
+	lockdep_assert_held(&rtwdev->mutex);
+
+	return !!rtwdev->csa_vif;
+}
+
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
index b14d7fffb98f..5b6aaa41bac8 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -246,6 +246,10 @@ static void rtw_ops_remove_interface(struct ieee80211_hw *hw,
 
 	mutex_lock(&rtwdev->mutex);
 
+	rtw_fw_csa_stop(rtwdev, vif);
+	if (rtwdev->csa_wow_vif == vif)
+		rtwdev->csa_wow_vif = NULL;
+
 	rtw_leave_lps_deep(rtwdev);
 
 	rtw_txq_cleanup(rtwdev, vif->txq);
@@ -394,6 +398,7 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 	struct rtw_coex *coex = &rtwdev->coex;
 	struct rtw_coex_stat *coex_stat = &coex->stat;
 	u32 config = 0;
+	int ret;
 
 	mutex_lock(&rtwdev->mutex);
 
@@ -404,8 +409,10 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 		if (vif->cfg.assoc) {
 			rtw_coex_connect_notify(rtwdev, COEX_ASSOCIATE_FINISH);
 
-			rtw_fw_download_rsvd_page(rtwdev);
-			rtw_send_rsvd_page_h2c(rtwdev);
+			if (!rtw_fw_csa_active(rtwdev)) {
+				rtw_fw_download_rsvd_page(rtwdev);
+				rtw_send_rsvd_page_h2c(rtwdev);
+			}
 			rtw_fw_default_port(rtwdev, rtwvif);
 			rtw_coex_media_status_notify(rtwdev, vif->cfg.assoc);
 			if (rtw_bf_support)
@@ -450,8 +457,12 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_BEACON) {
 		rtw_set_dtim_period(rtwdev, conf->dtim_period);
-		rtw_fw_download_rsvd_page(rtwdev);
+		ret = rtw_fw_download_rsvd_page(rtwdev);
 		rtw_send_rsvd_page_h2c(rtwdev);
+		if (conf->csa_active)
+			rtw_fw_csa_start(rtwdev, vif, !!ret);
+		else
+			rtw_fw_csa_stop(rtwdev, vif);
 	}
 
 	if (changed & BSS_CHANGED_BEACON_ENABLED) {
@@ -461,6 +472,10 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
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
@@ -504,11 +519,16 @@ static void rtw_ops_stop_ap(struct ieee80211_hw *hw,
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
+		rtw_fw_download_rsvd_page(rtwdev);
+		rtw_send_rsvd_page_h2c(rtwdev);
+	}
 	mutex_unlock(&rtwdev->mutex);
 }
 
@@ -640,7 +660,8 @@ static int rtw_ops_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	}
 
 	/* download new cam settings for PG to backup */
-	if (rtw_get_lps_deep_mode(rtwdev) == LPS_DEEP_MODE_PG)
+	if (rtw_get_lps_deep_mode(rtwdev) == LPS_DEEP_MODE_PG &&
+	    !rtw_fw_csa_active(rtwdev))
 		rtw_fw_download_rsvd_page(rtwdev);
 
 out:
@@ -857,12 +878,16 @@ static int rtw_ops_suspend(struct ieee80211_hw *hw,
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
@@ -871,12 +896,18 @@ static int rtw_ops_suspend(struct ieee80211_hw *hw,
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
@@ -907,20 +938,23 @@ static int rtw_ops_hw_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	struct rtw_dev *rtwdev = hw->priv;
 	int ret;
 
+	guard(mutex)(&rtwdev->mutex);
+
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
index 98a7741ccd0a..c98d4d6b9382 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1556,11 +1556,13 @@ void rtw_core_stop(struct rtw_dev *rtwdev)
 
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
@@ -1573,6 +1575,9 @@ void rtw_core_stop(struct rtw_dev *rtwdev)
 
 	mutex_lock(&rtwdev->mutex);
 
+	rtwdev->csa_vif = NULL;
+	cancel_delayed_work(&rtwdev->csa_beacon_work);
+
 	rtwdev->chip->ops->power_off(rtwdev);
 }
 
@@ -2176,6 +2181,7 @@ int rtw_core_init(struct rtw_dev *rtwdev)
 	INIT_WORK(&rtwdev->ips_work, rtw_ips_work);
 	INIT_WORK(&rtwdev->fw_recovery_work, rtw_fw_recovery_work);
 	INIT_WORK(&rtwdev->update_beacon_work, rtw_fw_update_beacon_work);
+	INIT_DELAYED_WORK(&rtwdev->csa_beacon_work, rtw_fw_csa_beacon_work);
 	INIT_WORK(&rtwdev->ba_work, rtw_txq_ba_work);
 	skb_queue_head_init(&rtwdev->c2h_queue);
 	skb_queue_head_init(&rtwdev->coex.queue);
@@ -2296,7 +2302,8 @@ int rtw_register_hw(struct rtw_dev *rtwdev, struct ieee80211_hw *hw)
 	hw->wiphy->available_antennas_rx = hal->antenna_rx;
 
 	hw->wiphy->flags |= WIPHY_FLAG_SUPPORTS_TDLS |
-			    WIPHY_FLAG_TDLS_EXTERNAL_SETUP;
+			    WIPHY_FLAG_TDLS_EXTERNAL_SETUP |
+			    WIPHY_FLAG_HAS_CHANNEL_SWITCH;
 
 	hw->wiphy->features |= NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
 	hw->wiphy->max_scan_ssids = RTW_SCAN_MAX_SSIDS;
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index 2830a5a57d61..3db76133d7ab 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -2096,6 +2096,12 @@ struct rtw_dev {
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

