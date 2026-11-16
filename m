Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813621;
	b=Jeo4oU4mi8HuZvm9gq5nU0Kxv4eZPQzVfnFUiV2pRlfvliVwSOFqiA6dygT+jALcVxMq
	 2jtd4RJw7oajrngIBFLdJ3imIJp5KbU2rsc3vdPOMpzyEh0m+j36oXsumD27PUM5TC7Tu
	 v6yF+xtbzTB1jcYlluU1owMDqOiOA0pzRUJB7KgoCd1ObIH8RC1aNXWSZuY8loGcJskHX
	 KPsg3AVgvVNP+u0H3E1RtrxjglFJfBWGT1hWhx5bNj2sJkW4c4cKrdfuAMWv0Kn307qNf
	 XuU4DRXGB8gppZhCVnz551HaXgm4vzHKmNh8pKUGBM+H6yiO/VlYo0ejbxt0MugxkEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CIz7ndvsyCbyZH1g3tFJ/ivm98WOfmiEiM1uFEhXtY4=;
	b=2GWiMWTXMq1BVX2TixQ35JZFzVr+ehhR8K6soa2vj9LnqabXvinqgi/DZD6LO+354Bu4
	 nEioL0YAZ4NsbBYj4vjt86CdtV6aTgOi9R5h/PggDzpw2gX0RIW8zD+ngKK/a/OYk4tfn
	 Sbvnh4gcRDMhN4SPm+DbMvacB4shyY4WyYCVjpd/1k0qyZ/hesMOyhrfvDodN3vECZTHS
	 1FeWRuLWvtECdq8Ch2kybeUP1WaESfD4GyOT5DTewbkxV5Z8IaIgld2dAAR06f+59ZrQ5
	 UtxYAsEFwCxgRg5oFyPM68+7wsUknojhTvnaihMQXEorqe4vwuR3jm33bpkYrrglvug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="L/oWxr9t";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF24606A883
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 07:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FF24606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L/oWxr9t
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso17838425e9.2
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 23:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794813619; x=1795418419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CIz7ndvsyCbyZH1g3tFJ/ivm98WOfmiEiM1uFEhXtY4=;
        b=L/oWxr9tjvuL2Yp32Shj9PCOiIar/2DY8yCtKcTm7hA96hMDTMNSt6gaUfEfVN7k2A
         cHOsDrz4l45bl/dRM91b9rkgKJXHAcyUjssKdxetIF7A/DCuQ+ww9JtM4LIoOGP5uFmf
         K5JVVr6YInoqn+6S2HZfykI1lu+1/+EURakGvTu1mc5dSVmjxWpA4D7KoFj4vqS98WIK
         mudIDDQLs8G/sZBIMCR6f5pMOmQICsahmQvXJv1o8K46RUTvBEnAYCKZoZE3+01J1DQf
         hxgKCJBc6rP5y3j7nlUkwg0qbIXVvd+zsLSQ4ijn/zmI6U9raCuzGhfNNkbB280zm8yO
         yMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813619; x=1795418419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CIz7ndvsyCbyZH1g3tFJ/ivm98WOfmiEiM1uFEhXtY4=;
        b=ar6RwEiFBTOB6oE4ftk9e4R1CxZO4XoHuE3X4rfSdPC/cIz8ZFo79Bc99Ijy7Fuqlv
         efmwaUKKhnbXu4M1TuBYXOQ7C/oXdoXqTS3EvgNEfSGM/ZjZvryvQjPljs6lOcdonGvG
         hUMMMmwPNxhQAurRr0WfVhqW/QD8LbpqUkWoUvzxRkAvnxvpBeRQOvkwi9s0FzcYt7PP
         woDtwsFWNdg/oMTZnkhyCArO1xJQn08q8WYeYcpaVN1Ota0HWvnn1c9LZNAS7RrRodzD
         a/I1U8H9J4xKrbpJntIiNP45ZSIpo5LSrv2jVR7zOaaptyevHrUY7lnUoD6EK+rfqLVt
         Klhw==
X-Forwarded-Encrypted: i=1; AL+hErGj4ccfqw1nSYVlcc0H01ZLTrmoT+mHtmhBliikQmijNDT+u1O+Q6oNyxdCakFpu6bVegTzHyJaOM2cSqm5hw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+6E4qm0gtcqC/f/SU9/0ejMPlgrjK+PQWfoUju6ovcXjQjGvaD
	ahhkEZHzdcLaug+jsF+IZ4r4kFsrYXQyr7oOGz1KK9OSADkoFXuVXShI
X-Gm-Gg: AYBFou1TNV4li2vWwKTrWkzOPNXODsgRiBSReUNI/ty+D7QalFu04EE8c9g8fD66Crl
	UG2jVdO0RGMu5QnoNfXq9MGRGta4U8u+m6s9nUFNvbdBBja47sGpO3ufvzs3UPZMsnWgpDtFNGO
	PQ8VzoniO0/YXDVGX3nR6VUGkWow0lf99/9tREaVTs/RP/e1O7iM+g+u0ZLoLSYVWn+w7Cbqpb5
	Vlv17gz9uai5/PL4eiEA+xVajlxghDvh9gYnnZSLfd2+lakeThPWLhAsPXQ9YXGXNouRdLZOEwJ
	yNdG1M+ZSrAp7+5mppKdFI3rw9Lqnjot+aqmK3xRHxNgPWj+OGtb1AR2LNIEUJ17aWAbnMEQ3qu
	9WXkUG3KpfEi89+KW9nwm0OqLHsf21X7LyO5jGG0o4sAeZ8amdeiTJl87n9LnKurVtg7yzcJYp7
	XXYzeP/+eVwM5HYOhTECenxkt4fTGNFO0V1d3+MegXeFTdIZ2z2iIdzpEi5Mq9NfRyd0x1tbJ60
	2F4ajYzEoUM/B+UBHW+QcPlGCoZ1OGApEhX87E+wCkp4QWTPFqbrWa7XbWgpQPgMLP65v+Ysa7X
	EuxLw6KhTNEDGLAOlZKgcJRDKrHrX/WHOYk=
X-Received: by 2002:a05:600c:4ecd:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb5599a73fmr228474695e9.0.1794813618803;
        Sun, 15 Nov 2026 23:20:18 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm22953761f8f.1.2026.11.15.23.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:20:18 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v2 2/3] wifi: rtw88: report the frames purged from the TX report queue
Date: Mon, 16 Nov 2026 08:20:13 +0100
Message-ID: <20261116072014.1142494-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116072014.1142494-1-mehmet.fide@gmail.com>
References: <20261116072014.1142494-1-mehmet.fide@gmail.com>
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

A frame whose sender asked for its TX status waits in the TX report
queue for the report of the firmware. When no report comes, the purge
timer frees the frames with skb_queue_purge(), and rtw_core_deinit()
does the same. mac80211 is not told: the sender gets no status, and the
copy mac80211 keeps for the status of a frame from user space stays in
its list until ieee80211_free_hw() warns about it. On an RTL8822CE with
hostapd, after a firmware crash and an unbind of the driver:

rtw88_8822ce 0000:01:00.0: failed to get tx report from firmware
[...]
Have pending ack frames!
WARNING: net/mac80211/main.c:1761 at ieee80211_free_ack_frame+0x4c/0x70 [mac80211], CPU#1: sh/24725
Call trace:
 ieee80211_free_ack_frame+0x4c/0x70 [mac80211] (P)
 idr_for_each+0x6c/0xf4
 ieee80211_free_hw+0x30/0x8c [mac80211]
 rtw_pci_remove+0xd8/0xf0 [rtw88_pci]
 pci_device_remove+0x44/0xd4

Take the frames off the queue under its lock and hand them to
ieee80211_purge_tx_queue(), which reports each one as not sent.

Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
---

Notes:
    v2: Reviewed-by Luka Gejak, no change

 drivers/net/wireless/realtek/rtw88/main.c |  5 +----
 drivers/net/wireless/realtek/rtw88/tx.c   | 20 ++++++++++++++++----
 drivers/net/wireless/realtek/rtw88/tx.h   |  1 +
 3 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index adc54b063382..ce65a1a80840 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -2225,7 +2225,6 @@ void rtw_core_deinit(struct rtw_dev *rtwdev)
 	struct rtw_fw_state *fw = &rtwdev->fw;
 	struct rtw_fw_state *wow_fw = &rtwdev->wow_fw;
 	struct rtw_rsvd_page *rsvd_pkt, *tmp;
-	unsigned long flags;
 
 	rtw_wait_firmware_completion(rtwdev);
 
@@ -2237,9 +2236,7 @@ void rtw_core_deinit(struct rtw_dev *rtwdev)
 
 	destroy_workqueue(rtwdev->tx_wq);
 	timer_delete_sync(&rtwdev->tx_report.purge_timer);
-	spin_lock_irqsave(&rtwdev->tx_report.q_lock, flags);
-	skb_queue_purge(&rtwdev->tx_report.queue);
-	spin_unlock_irqrestore(&rtwdev->tx_report.q_lock, flags);
+	rtw_tx_report_purge(rtwdev);
 	skb_queue_purge(&rtwdev->coex.queue);
 	skb_queue_purge(&rtwdev->c2h_queue);
 
diff --git a/drivers/net/wireless/realtek/rtw88/tx.c b/drivers/net/wireless/realtek/rtw88/tx.c
index 701ed7c4f3f7..87d993282b1c 100644
--- a/drivers/net/wireless/realtek/rtw88/tx.c
+++ b/drivers/net/wireless/realtek/rtw88/tx.c
@@ -176,21 +176,33 @@ static void rtw_tx_report_enable(struct rtw_dev *rtwdev,
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

