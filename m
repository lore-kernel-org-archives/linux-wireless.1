Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794432765;
	b=jbs9Z92bJ9PsSaFTAvlZkEiE7MH4D3e1CUlraHDCQAerSQ/zt3A94qz+VOwclTMPLTju
	 jytCTj7jV+Nem8grPLN1Vc/SuCHA6c18amtNcNqfG9O9VZ7x9h3pMNXiiYX0yn3scFAgc
	 5s4NhuihJEFoYjbsz58lZwkFdh+b0KHmXxKZhBfJIVwhNiXBI9QYPRehpceoUJXrreAaD
	 L/xfbuGHNVRs+GkGr8ADrFy/wH5JAZ8brapFUb9Kkm19wl0vOU++tDjmXmAsKEzMHsrEQ
	 pKHCgy/4VwLgoRK94Oe0i97W36vf/XPEPPI2fXWgMCM94we/5+l6jn0OACTSIX7Xb7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794432765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=87NKZpw8mCYgvP8eMOLFpOmcZM1ld6VOImSFhCZ5SZQ=;
	b=km7MIJklYQAqNIMAwjVRH+jWj2JJafZkkkQAFGmqnVqZGMtMwzqX1yPzz1lvgKc7hzcY
	 JbtXl+O2IYV90t42HpD/Ao9M4tjCwTUd5W5Od7cQ9179pDnJMsFiFKI2BqDmNnnmteZZ2
	 rSLGs0jDglU4QRgnsWc6xN6pABzpHZcBldXXVO6rLnI/x5duHsrBqqrdHGW9kqXJ+xK/X
	 e00eLUVJBOI11eclji18+dQfQmGGNyRRWxv9V8xVYlD6BWQpvqVQIjQBSCNUTWrbnYXM0
	 Z2tmjiRf6l168+xCcJA5dTPo8p6GNkrBNPPfZnKi7eZsYmC7Z+MDNuf1eIkN0T2ETLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MxiGn7m4;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BB9606A8AA
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 21:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71BB9606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MxiGn7m4
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so28652615e9.3
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 13:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794432764; x=1795037564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87NKZpw8mCYgvP8eMOLFpOmcZM1ld6VOImSFhCZ5SZQ=;
        b=MxiGn7m4LINkt9RgVRCtFxPVxOWtAUL9LpRtenJCmXtkn16kx784mBx3jgLM6TmPEE
         Bn6g3ntusSeESK/Wvy+T2MQ+IT4iRb/TsY4hgqvAmwtv4GR1jygNa27gjk/xAkTw3E6F
         RNS6hssS7xomSJzjUDMJ4yMkac6CB9vPHdpXktMC1NyQFuWNCe0wAM8+TZLCXERIR8qK
         uRTzLSHG8oM0Sd8PP3tq5k6KR+2lTaatRG/0XIqyiNFEsAXTbHlj66Vd45kmUp/39Uqt
         lMPJuD8MxDHCa7RtfW4RurCGTKozjXjqBcvxdL9tvDI4Yq4L1oQ86Y99DiWXBlnrMq1H
         i+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794432764; x=1795037564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=87NKZpw8mCYgvP8eMOLFpOmcZM1ld6VOImSFhCZ5SZQ=;
        b=2n5JyC5IZoMNYaxHlW4bpw0sgXbi/6SzVKexbeWtDqwBsRbiKJgNK7aqUCC+K1sN1A
         A6tkZwabq8JqXrc5x8H3EmWaXE2iG5S2qCCw/aRyPAyHlqDXzz/hwddPpOgtpmfl3Sk/
         VMDhA3YfOtXV6Mx1IICz//off64kA5qhiR9TiA5LZy4LagckBoQkboCL/NaH413fxOKg
         ySgCKkn9sioQ1C6DOw/LZD3QqUp0PjHCNb8vJTaigIli91hivfc/l1G8QkUU6f8fL/1c
         luie0HW4gWpf7RU+NATC8Dl++M2R+iVUzLUtTRwgzpZmYX9yY8y7tZxKiNzaL0WjnF4R
         BKHw==
X-Forwarded-Encrypted: i=1; AL+hErFV3W9DRBPgxSC5zLLT2CIGdktSoNInNLzAnJtfMsSBHlIuzIRnNnXxhw++oJkms/j0wHa5VnMi3UM3EJ9C6w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/a3MNiRb8mcnviTAS8ClkfV1NpN2lk92cOhMVmAUn0l9w1axHF
	v431ho1sKq+fkCVdDG+BYw1YgXWsc0/yLl6uK1aWXagTRVAWPD5r0Guo
X-Gm-Gg: AYBFou3+ERcLaBdJ5Saba367R9I9zbcuaRQJ7cCS9rKN2osUS/dhveVEnpWTEYsjQtV
	geZdbHcKGQErYU9K+3q1ZhfYa5BRPMmO1aQOCTDSkLKEAqhDywFiXI+zBx+7A0N81gkYnVqT5E+
	hEGcyR5KZtlZPGfLrqgQSc6HbddcLLj+tliIpsgmOxlM0mNDTmrGsz8FWYX33QQOOGjkqlV69mU
	MM2Qnd6TDtLGiGNpFpyHETyMWVW9Y0hyn/k6BNvUAfy2g8vC3die6G+VcVIEp7F/bAKmZ5Nhjdd
	NylFHPVK5N5yYgO1GHlOOt5FpbYjSBltg4bgmK/n7uBxKc9Oaln+JxTw4mg1RLiTVUH+qyaW77J
	lzPn24hcWmLIixegKfJIPIvi6oCtdh5YbWDVEwCn5L9HuQSnCLAdx7XJuT9PKHHAgXEU8y6IEw/
	mnxm6BXVDXK6HxGqQY5yW1VAsyRHxFzwJ8UdxU9WdTGPAq7IPQbA++MlYiFl/gQ+TcDgWjUsg6R
	i4y8nrUDf6DzAjbgrg8k6xGeYNXgHEZI8gIUl++co7bLaSpJURqaaDtz/FGXrDgea8MFznEsV1s
	NiI50d9wrX8BfUlZIWDcG8Mirm6cb058RiY=
X-Received: by 2002:a05:600c:620c:b0:4a7:9044:a87 with SMTP id 5b1f17b1804b1-4ba093ab877mr61489955e9.27.1794432763829;
        Wed, 11 Nov 2026 13:32:43 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba095200c4sm36726845e9.2.2026.11.11.13.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:32:43 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next 2/3] wifi: rtw88: report the frames purged from the TX report queue
Date: Wed, 11 Nov 2026 22:32:38 +0100
Message-ID: <20261111213239.569224-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111213239.569224-1-mehmet.fide@gmail.com>
References: <20261111213239.569224-1-mehmet.fide@gmail.com>
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
---
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

