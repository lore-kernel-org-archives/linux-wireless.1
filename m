Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935409;
	b=AtD01xaLPL2RB0frm2KQdcT/Dmd/ykzFWC0bedYo8DaDAOq5US0UY6dBCmhzpOktF+/s
	 LtzhBM1DAuAiwFqM+7TTyaG2bB1CNuPUIDqt+tGwPHO164lYTKWAO+ct97IuooabK/Ps9
	 tgAT3AtDlckR0iUub0lQFInvR4xQRr3DqZhLPRH45lt2lCwPNs0sVmW/MR42mupVLkTEZ
	 JcVf/XOexLM2sj0AKh6h4LJEkw+TrDAH90CPQENRg2T3/nS5Ex/5XXviNBouVapjn7Lcp
	 jrojvbYZ3og94c1q8pKU7ndMBc0dvt6Mlj0ut/z/bDz+PVyanPTUBh6F+HzYP1U5vSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qjjJXnvyNTC6yhXiM0fu7sw9ftTlNutzFX7AfJ2F8JE=;
	b=USPdsz4wrb9EaT+WE4YIeFm4LDVdNsnsH141nrdzx4MO0qVCDsBgmy/pp5laWNowU49l
	 GJ/fwjoyFg9r6ori/bzNQXZT4h8Awrcavwjlt0sFs2J2avHpgI8T6INqRR0gM3kOAU7dR
	 eTNTCFBRrmfqYEj7KitMlLbeQUkp59JzjTOqySzh9cxvyY9C9ALfY5lAu7AMPi+41xOyY
	 ZA1p3SnyK4pWHYW0jSj4MqExeLmJVtjttFdFi6U4eztXb3idHh0kfC5peMPjQSBb1Iuf+
	 nnw7bEcmL+EC2tVQBFiwoTVov2mMqIAuecj1kqzW5v8/NxuCdcJ0dIh3Vj7/6CRFd5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NItphpPY;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A49606A337
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 17:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8A49606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NItphpPY
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso2106149f8f.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 09:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935407; x=1795540207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qjjJXnvyNTC6yhXiM0fu7sw9ftTlNutzFX7AfJ2F8JE=;
        b=NItphpPYmKitsve4LK2rGhJAu79jbF6rTYkjsOEvXBvQ+nMB8l0fhbDAHahWHudihA
         rmY9ZtTFTXu+9eVZzeFxjH6m/GC7pnnXlMIguVpdHXS4KoxMbXzfMxD3ovOJXoNtBCUk
         xAIeYqC+mqd9cK/RehXH8OCI2YdF6L5e2xs4L1GvNdGhXe3LkmiS7Lqf+qlUPnXxzryy
         BsmbeU3bLSii6DB3wNJGUqaMIeW+MfiU1it0DZYjq6eataDwL6w9uPt/2qmA0Ay+CrWF
         s+FCiZpfYkbuFXWXhJ04Wy7sJEZnl5UNKgzlz0EsmqBteODRaTbdy9bgosSkfCZdrMrM
         LkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935407; x=1795540207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qjjJXnvyNTC6yhXiM0fu7sw9ftTlNutzFX7AfJ2F8JE=;
        b=eiVrzIacTkJ2sOjmzrKXjxm4GF6uq+IaflI0xxeEmWq8z4zICV+c7veYzvEVmd089w
         80+ZivYRZZlwYrsNLgcXBnvQ3zZYNQ9yKzsZRyWmSY/uwh7sXL+gH8dHI2OwiZZUdNdm
         OlTlSzbVMQjKwPqe3lVEgjjGjbirrC2HpgBuaRaFzczBcHqZL2s2KW7u+ORsnBD6gfq9
         b7rdJF1Pi5shV154nKgaJKI471YCIXeJvtSOW0Dx2MIB9ZZPksM0hGS3wkTNrEF2TIDm
         Hdx/SxhZUSW4q3L//+LXVBjkOchQ7pw3N5AXCClUusvqSGnj0IZQ+7Pk0pB15oDYKB+J
         pNdA==
X-Forwarded-Encrypted: i=1; AL+hErFdoI+0zLT98unOURobx27hIQ7pbl6L3lGmIy6ivYtFPUWJG4ur/6I7WxnXgmYwveoryzYCirwAwGrYvlIjIQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+KuGfTD78FrbVoqaFSc7yR+0N46nTj+rLfqUyxaFNatcPghQ7G
	W361xc4MkZT5sl7WD5ilHxk0IJZAb19UwBcpc5NcDVBPKhvHuucVsRge
X-Gm-Gg: AZFdTZfNa7uy1d+NegtObH8iIaTkRghqTo/qKgBqsbD17xtJkhjyDS0xGReilrZv0XY
	Nm2x5mZ+JvOzCBMXqq3aV5siuiw9G+FF70oUL+3XIc+xO29VIxwOEg6XKmU0zDODpO5PvFMSSnG
	LEwNsLb+7dPK4BZSDmwIduhSOnJ0olqJGG2rypiGNfU7T8JarFUUwTpBSWwbvQSJN6fhCmlg8ys
	mrZbgKaYzGPpkWb/1xirEeGsRdcmD/rQ/8p062E32HUJNWaYhphJ7pnaCBl685YMXuNT/Qkdpp+
	7zRoMgo5VVd/mRZH32LlzHGETA0nBRlCud7fs+eztWX/yWmwqemYUI5ZuaszP4NmPs+WHsrYl0T
	sDSqGkR/Ao/o6nL41Da6QRd06SaA9f0bUZfSURAFLgLhG9soKTU9Mofdfe/tNs2yzXviHXPTqTv
	1yWRrE+uOSDA/KZa/R+29Zo2p+hAeIOa3w5YC2AF5xdpfaEIVWvEiNX6BmBruLdavMoPIuKicpR
	WzJGukxA9zBbr0MMShc0MYBNzbXoEipaI86qBFR5awvgpoX/oJRuFV0nSNC0zrNcvWLHIP0LW9l
	AoL6Q1wZ/7WpwlFq9+/pveHMgK78tmjx/nI=
X-Received: by 2002:a05:6000:25c6:b0:49d:7e8c:e89c with SMTP id ffacd0b85a97d-4a63d985dc9mr94898f8f.42.1794935407126;
        Tue, 17 Nov 2026 09:10:07 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6d079a2asm26828762f8f.16.2026.11.17.09.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:10:06 -0800 (PST)
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
Subject: [PATCH rtw-next v3 2/5] wifi: rtw88: report the frames purged from the TX report queue
Date: Tue, 17 Nov 2026 18:10:00 +0100
Message-ID: <20261117171003.1840491-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117171003.1840491-1-mehmet.fide@gmail.com>
References: <20261117171003.1840491-1-mehmet.fide@gmail.com>
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
    v3: no change
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

