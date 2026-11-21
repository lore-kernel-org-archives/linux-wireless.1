Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288535;
	b=2nlL+3S2tSIh7V5mgY43iqkjsb7FqVjw0XYdVEpd7YBFlzsRiVDcAMwi0LaNo2RC5sVY
	 DAFRgeiEJTy0rmYYL6EM4iU0RKIXE+osa+tIAFjgsxgYxtgynbcKgpa6PPdpSqU3mxUop
	 OhsjQQKNwuFQ4g6HuLFB5y4B2Kt/w7Pdjvh1kI1krbhdtsPtMCpdpWXSu7o4fUrVKkt1Y
	 J3zccnAHfwamTnGe1pFRCIpJDgUt4s1MexeKwMjm2Gy4Z9j6qEoHdWx4FhNhBqciqK3wd
	 ax3LLCNKWCmbtOw5mxC2bx/JeMaSnI8kQL4er/lFzSa5Z7kM8HaLoHqAs8E1evg1D/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LsJpttozs3yuwMCl6tnQ3XuoTUQVsQjXfpzR8Fi44Q8=;
	b=vN8C9VD3LeUTpiMw1WwmAdjY9ckTauX/woiM5lx+vYPJbT5VwgErwpQg6EFjRhV6j2mt
	 ml9BvF0TPNrDAWXWsVEbdG4oVm/0hQg7LdWPSCxhQsvM/0UWDdpk4sL05SMeizGd8Fhay
	 siyIRH4RKu6feB+iqtxrUAv/QeUJ4ctyeuERgfL1fTy5swBjtrnLqBeiITddlK1rShPwq
	 5IBMj1Oz0NX91+wYlL1/aENdGaRK+XDZhNngJeJ1CTAuyDYsCjNUqUa0ZKfD64PpQ+0ZI
	 S1mIkCTUV6UhlN89pLn4GT3e4h0oMl9D+qWrjzOfrwutcZMBPjkllfRy1+B8qMLOBiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vQMj9t2b;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F02C606A686
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 19:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F02C606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vQMj9t2b
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso22966295e9.1
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 11:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795288533; x=1795893333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LsJpttozs3yuwMCl6tnQ3XuoTUQVsQjXfpzR8Fi44Q8=;
        b=vQMj9t2b01I0d2jqIgm4kQJO9p7STyfO+DAGul7bsguEh5DkLDi4obdoDeb8EgXwUc
         1vBliKWtEuK8rPRTmqXJp6fcegxmA0Kf9+826z9kdfpwcdmmbHDlxla4IsDyHrTwnat7
         oWFWGxHtIfFhnAGJLgodyeUjaffoxUe7cCLgR41mym09NTglfYdnSqL/7d7axkhjfVuh
         hmqYalaVMB9nGNW/mEwMrdEi4qlPqbDkanAd8IQ33NT4qH3NyRAzQ9AvsNRVt4c9JqGj
         d9334PkQSKcgIQjRaGVvoieHne6QRmBvLcXz6GjS2tot069QAKoboR9D2zvJ9fWvc/K3
         7PzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288533; x=1795893333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LsJpttozs3yuwMCl6tnQ3XuoTUQVsQjXfpzR8Fi44Q8=;
        b=eDTRtog8bd2LtBwEW0byanvvhUAcko7gDdOTYke1oSoBfCfSfO96ezswgzNZ+6kKaq
         +W+ML5GFbfRcPK4gUMqwnIE4GLei1T/h+YRxG+tgfWWIR7ke0smqmTkxKa0X6w7Yf8IL
         yzerjpn+y5qpdaIzjflKtDXUImt5qLfpBKjizdtyvllYaoYADsfu1GT/+8/jD1ywGyNm
         AJcu5T82hRzkmY9q74zCc58oEaaDACvcW8GbaHjd1iEAquxadiAHkkX0Z9c2em4qoQr9
         +Ur1CIWu1zu7Nm2K6WqiWuQNzqlrKP8FbFQzGW+iItChTGMse0B6xtGCXGfenYHYNCZ/
         bbZQ==
X-Forwarded-Encrypted: i=1; AL+hErEGfM2AiLx+e2Stw4uTU5OUMmTSB/6VS+eeI+OdnXD+/c273Wj3XhJKHMe4A0d6VTG+bKWCcCT4yA0iErmfRw==@vger.kernel.org
X-Gm-Message-State: APuU4Z//Hj3IBrYSJQgdF160PIXb8wrTx32QughPAZZY1rEwz1etjTF5
	vqT8BbkAKyNNIOjldVp1YqGHhacDlb/5M3Hf8wliWxmKccGg5nHiLd+J
X-Gm-Gg: AZFdTZfSXoSEr+tVPig2kluhVzwlwCeoM6D88FdJRVW9vMaRXfjoGMjDD3Bnel9acch
	dL+eHT/wyqj2idwy5n+Jze707gvE40fj5yobN7Od0URKSY9cLslwcmSjx9bG9Jrf/idxD48aTYL
	zdTP8uAQwrcCvhM/5/ouS7RnWJEiHiA8F7Q8STHPohj8G7lyy7Hq8ymQDo3BwYmexbtPgEP2rc7
	RjMbJhsWHxbcZaevUuDwp4YKWL6nVLSYhBnxwXhyGG4OCU+eeb6Px31gIeQWdqKBo0XyTimijGb
	s652kHZ2zzctApJl1BAOAgRHOHVzDVkiOnktlb1XRvbw7UM9EHkOWAOufA78qLfjVRzPwTWw8JO
	ryjBC8pE6rbZrmMBRqKFh8fVmG25WvOdS7/WZm6bNffS4vxYVTHRSWMQzH2iMiJzvIrOz6N724f
	r50ES/O9FyAro/KB4sBG3RNPcuOZNpNERi/oMca9hC0lT0pFwfaXuMT6+hUWSs8qY++shl6kS7K
	ifXLMed2S6KamjGiTqrl3VXJ7rHWUPxiIZHUyBtiKsvwEWGgUtQe1lA9HhkZnsQbiFSLaGvFAWy
	EFDpGI1FVvxn+IOA2EqJLW0ZdBkDMZfXOI7d
X-Received: by 2002:a05:600c:820c:b0:4bb:7987:fbbc with SMTP id 5b1f17b1804b1-4bb887c29b4mr139418425e9.1.1795288532720;
        Sat, 21 Nov 2026 11:15:32 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm194929325e9.7.2026.11.21.11.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:15:32 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v4 2/4] wifi: rtw88: report the frames purged from the TX report queue
Date: Sat, 21 Nov 2026 20:15:26 +0100
Message-ID: <20261121191528.591334-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121191528.591334-1-mehmet.fide@gmail.com>
References: <20261121191528.591334-1-mehmet.fide@gmail.com>
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

Frames waiting for a TX report of the firmware are freed with
skb_queue_purge() when the report times out and in rtw_core_deinit().
mac80211 gets no TX status for them, and the frames it keeps for the
TX status of user space stay pending until ieee80211_free_hw() warns.
On an RTL8822CE, after a firmware crash and an unbind:

rtw88_8822ce 0000:01:00.0: failed to get tx report from firmware
[...]
Have pending ack frames!
WARNING: net/mac80211/main.c:1761 at ieee80211_free_ack_frame+0x4c/0x70 [mac80211], CPU#1: sh/24725
Call trace:
 ieee80211_free_ack_frame+0x4c/0x70 [mac80211] (P)
 idr_for_each+0x6c/0xf4
 ieee80211_free_hw+0x30/0x8c [mac80211]
 rtw_pci_remove+0xd8/0xf0 [rtw88_pci]

Free them with ieee80211_purge_tx_queue() instead, which reports them
as dropped. Clear the TX status of a frame when it is queued, as
rtw_tx_report_handle() does, so that a purged frame does not report
its leftover TX control data as status flags and link ID.

Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    v4: clear the TX status when a frame is queued (Luka Gejak);
        Reviewed-by dropped for that change
    v3: no change
    v2: Reviewed-by Luka Gejak, no change

 drivers/net/wireless/realtek/rtw88/main.c |  5 +----
 drivers/net/wireless/realtek/rtw88/tx.c   | 25 ++++++++++++++++++-----
 drivers/net/wireless/realtek/rtw88/tx.h   |  1 +
 3 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index 2a38a6828e3a..564cddf0bfed 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -2232,7 +2232,6 @@ void rtw_core_deinit(struct rtw_dev *rtwdev)
 	struct rtw_fw_state *fw = &rtwdev->fw;
 	struct rtw_fw_state *wow_fw = &rtwdev->wow_fw;
 	struct rtw_rsvd_page *rsvd_pkt, *tmp;
-	unsigned long flags;
 
 	rtw_wait_firmware_completion(rtwdev);
 
@@ -2244,9 +2243,7 @@ void rtw_core_deinit(struct rtw_dev *rtwdev)
 
 	destroy_workqueue(rtwdev->tx_wq);
 	timer_delete_sync(&rtwdev->tx_report.purge_timer);
-	spin_lock_irqsave(&rtwdev->tx_report.q_lock, flags);
-	skb_queue_purge(&rtwdev->tx_report.queue);
-	spin_unlock_irqrestore(&rtwdev->tx_report.q_lock, flags);
+	rtw_tx_report_purge(rtwdev);
 	skb_queue_purge(&rtwdev->coex.queue);
 	skb_queue_purge(&rtwdev->c2h_queue);
 
diff --git a/drivers/net/wireless/realtek/rtw88/tx.c b/drivers/net/wireless/realtek/rtw88/tx.c
index 701ed7c4f3f7..280292a41402 100644
--- a/drivers/net/wireless/realtek/rtw88/tx.c
+++ b/drivers/net/wireless/realtek/rtw88/tx.c
@@ -176,32 +176,47 @@ static void rtw_tx_report_enable(struct rtw_dev *rtwdev,
 	pkt_info->report = true;
 }
 
+void rtw_tx_report_purge(struct rtw_dev *rtwdev)
+{
+	struct rtw_tx_report *tx_report = &rtwdev->tx_report;
+	struct sk_buff_head purge;
+	unsigned long flags;
+
+	__skb_queue_head_init(&purge);
+
+	spin_lock_irqsave(&tx_report->q_lock, flags);
+	skb_queue_splice_init(&tx_report->queue, &purge);
+	spin_unlock_irqrestore(&tx_report->q_lock, flags);
+
+	ieee80211_purge_tx_queue(rtwdev->hw, &purge);
+}
+
 void rtw_tx_report_purge_timer(struct timer_list *t)
 {
 	struct rtw_dev *rtwdev = timer_container_of(rtwdev, t,
 						    tx_report.purge_timer);
 	struct rtw_tx_report *tx_report = &rtwdev->tx_report;
-	unsigned long flags;
 
 	if (skb_queue_len(&tx_report->queue) == 0)
 		return;
 
 	rtw_warn(rtwdev, "failed to get tx report from firmware\n");
 
-	spin_lock_irqsave(&tx_report->q_lock, flags);
-	skb_queue_purge(&tx_report->queue);
-	spin_unlock_irqrestore(&tx_report->q_lock, flags);
+	rtw_tx_report_purge(rtwdev);
 }
 
 void rtw_tx_report_enqueue(struct rtw_dev *rtwdev, struct sk_buff *skb, u8 sn)
 {
+	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct rtw_tx_report *tx_report = &rtwdev->tx_report;
 	unsigned long timeout;
 	unsigned long flags;
 	u8 *drv_data;
 
+	ieee80211_tx_info_clear_status(info);
+
 	/* pass sn to tx report handler through driver data */
-	drv_data = (u8 *)IEEE80211_SKB_CB(skb)->status.status_driver_data;
+	drv_data = (u8 *)info->status.status_driver_data;
 	*drv_data = sn;
 
 	spin_lock_irqsave(&tx_report->q_lock, flags);
diff --git a/drivers/net/wireless/realtek/rtw88/tx.h b/drivers/net/wireless/realtek/rtw88/tx.h
index 168f48e87853..363f63525965 100644
--- a/drivers/net/wireless/realtek/rtw88/tx.h
+++ b/drivers/net/wireless/realtek/rtw88/tx.h
@@ -98,6 +98,7 @@ void rtw_tx_pkt_info_update(struct rtw_dev *rtwdev,
 			    struct sk_buff *skb);
 void rtw_tx_fill_tx_desc(struct rtw_dev *rtwdev,
 			 struct rtw_tx_pkt_info *pkt_info, struct sk_buff *skb);
+void rtw_tx_report_purge(struct rtw_dev *rtwdev);
 void rtw_tx_report_enqueue(struct rtw_dev *rtwdev, struct sk_buff *skb, u8 sn);
 void rtw_tx_report_handle(struct rtw_dev *rtwdev, struct sk_buff *skb, int src);
 void rtw_tx_rsvd_page_pkt_info_update(struct rtw_dev *rtwdev,
-- 
2.56.0

