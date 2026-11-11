Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794432767;
	b=AkcqDX2TSxY5UF50JgmksAbc1rkNWIpvg8somSAk484R3a/B2N7WKUBXEKixKoBsPNEp
	 VxgR6/d8mbQUUZv+Rs33RQvr+4HSF2cUTgj42h/mid+FFNeNUchwLItviVsrb1V9masgU
	 s/NveWjnSgYSXZioz/MEaZYJx6PQPRHxZvLwC7CTNKQd9egpP8TtR2JyLynk0ZfbIeXn1
	 RjcK99fSnIeWGagYzUy9+nQapfx5g/htHly8mRUUb2tPbF38UGYEroiOn4ZZHv8tte1dW
	 Bt5CY2XH1nuvPvfQhSmtglPpi+pcbA6+tKiNTJh3W3jWos/iUuDpGzixcXfz1OYkRRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794432767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sFOzcPCn2H5HlwBzabRoHMTIRxdnOaCKxdgOfK0fq+w=;
	b=jwNUNiyoMIOf4xttk405uQ3aD8MA/EaD0ZD/R3KHbEsKpAyi29EIjRLbTBVI0AF0UHf/
	 mSuPhoHi0cC9fror4anee/AD+yWNiQpPzk5zz81vMVGo9HaApT6fDbfK4qA8NrwPuGbMg
	 lDVFRqIgsrvDGv25xFjhXF7iT/qMPBLEWGVGJJazRjOMCQYrALIY1igg8uhTRj0a2B2eD
	 0JxujYIVvwbtNsXUoD+YAAXpFjcvmaV9Dzmo/fh2xQNqmorJOppsx2qwDSQIpfA0PIEDt
	 ikZQjvoS6d44K0mfF0t6S3KNRwwADObSp3Jhulc/E5j2gpSprNbSaAZpi3Ti8QLeOYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vGg1OGQd;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D71360A2602
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 21:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D71360A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vGg1OGQd
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so23416085e9.3
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 13:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794432765; x=1795037565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFOzcPCn2H5HlwBzabRoHMTIRxdnOaCKxdgOfK0fq+w=;
        b=vGg1OGQdEqFYG+5OJ7Ad2rzugyxyNRWf0uU1ZduzAA3z/MeFo9zfKmcOLQUDZabkBT
         CruN3VwUOphpIrqSXn9eD3gIUlx98BY8GZuv+qBckXx8f7Sc1ZdPEmg9uqshs/z+bzzT
         6onrDJcUKOW121BLcx7+2whSiFhJnvkQF1+45+GZzH6qU0ByIMwcEYSLPbvIBWA9MLjA
         Wb31qEOLvK9v7sjxj1LfltJQT6UDaymAmuMybDdLutZYawKVpe/07lzXwNP+RxQiboIJ
         0LRBslXqh/7amG179abKNq2JJ+fJ570q5P2I2aqHRDcbhusn9XSRVhefiLrtdDK4l87W
         xv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794432765; x=1795037565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sFOzcPCn2H5HlwBzabRoHMTIRxdnOaCKxdgOfK0fq+w=;
        b=ZtVZ3rBrzTL3fbHEYR4ao43I4srU44KoHBl0fvmDsF46D8hx1xnqtzSm71YWlA4Tb6
         NLZPdTxB78xiuMRPuAkLGHf2TFBYdr/QG09O7B/biG6tbE5/dowXfCIUWCHaO/YUOKXY
         eTYqXJF2w/uJnr6Bd0DEjMslvJCgvYEbNPqirph1Yxt7nLUm9RUtp6lPt0LX1BdFkq8F
         b92nPWQRqDWpgdP8gZvswUoZIIhkJBNmwA1Rm90k6OjKRH3T+l5K2lrxwOGPWAl8VS+L
         1Bp0goPVthBEYjktD1gyGleNyl86tjhzAyGKYukq787DXjrnHKMJKwvspq8K5eodEUB2
         y+Dg==
X-Forwarded-Encrypted: i=1; AL+hErErCT2jRaa4SXxxyIEKpuam6hIckl9oK8v4dBtGbOw3D9lycoZf9UBitoNTNX9evZlo8TGrGzAAN2syKRmhbA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+BlygPaMrXg1UNoG3yWs9RgJpwW1WBfLTCIKTAFMjzSvc0xVM6
	oyhmAyenhJigS3PIU2fRcDMopacB/B6xhnihVy96t9B27OBXQjTVvKpo
X-Gm-Gg: AYBFou13y9iFnQwUkV02aLzLXjFFAo4ZpMoCXVKdc/zeAbFgpbV9QYKwRrFp9rnqOJ7
	iNr6Ls99lNmH3JHvBZENa+lzhaHWQ/Am/rHOPwyrQHkxkWVg4632Ishd4tpyxZ1p2srgj3RX4W/
	Av+MxN33UFBwwafwiGoQqjJKt7of/7Ua3QGVuJAkg9ff1G7UIenTfS8zrkdOoW1tTtZ5sCXME1g
	u+lwosCYVdfmtFFR5LShHgRVVxKjsYIK+wPxRzj6lZfcMpYfI2F6yEXv9arjlDeHTX5wpHNNWy2
	FJT8lGtATYgTK5ZDiK3h0iSHv4ww5/4ReRQM0p1x1YBrz9oEr0Ea+LKiQfmkxpSjKom3zXc/c58
	6X8B9C9/fw043l9CpJ+OQNlS/+DEQsWtsriYmHBOfOzvISPIq/+xLTpJcIEJmoFdcm1TmP33agV
	heUE5uGoOcwR9Rrln25vPkf98msDRCrRmxqKWoCr7IWa84HjgqZyIJm/EXvBbzXuyWV6WgvwOWI
	+oIKoF+pH8OPDGTm0ioVBx5GSbQSPoZKFZBJeXLBmM6KcuLLnJuUvdAsa15N6bzE7zy1NZN7AIQ
	IgDneqc+e28XVNe4ZXVfHpQyfFUA9A9PPPM=
X-Received: by 2002:a05:600c:e545:b0:4a1:ac66:6059 with SMTP id 5b1f17b1804b1-4ba093bdb35mr49832185e9.26.1794432764885;
        Wed, 11 Nov 2026 13:32:44 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba095200c4sm36726845e9.2.2026.11.11.13.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:32:44 -0800 (PST)
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
Subject: [PATCH rtw-next 3/3] wifi: rtw88: reset the stations outside of RCU on firmware recovery
Date: Wed, 11 Nov 2026 22:32:39 +0100
Message-ID: <20261111213239.569224-4-mehmet.fide@gmail.com>
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

The recovery after a firmware crash removes the driver state of every
station with rtw_sta_remove(), called from an atomic station iterator.
rtw_sta_remove() cancels the rate work of the station with
cancel_work_sync(), which can sleep. With a station associated:

BUG: sleeping function called from invalid context at kernel/workqueue.c:4722
in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 14, name: kworker/u16:1
RCU nest depth: 1, expected: 0
Workqueue: phy35 rtw_fw_recovery_work [rtw88_core]
Call trace:
 __might_resched+0x13c/0x1f0
 __might_sleep+0x48/0x7c
 __cancel_work_sync+0xa8/0xb4
 cancel_work_sync+0x14/0x20
 rtw_sta_remove+0x34/0x10c [rtw88_core]
 rtw_reset_sta_iter+0x20/0x48 [rtw88_core]
 ieee80211_iterate_stations_atomic+0x80/0x144 [mac80211]
 rtw_fw_recovery_work+0x1dc/0x2b8 [rtw88_core]

Use rtw_iterate_stas(), which collects the stations under RCU and calls
the iterator after it. The recovery holds the driver mutex it asks for.

Fixes: bcafcb959a57 ("wifi: rtw88: use work to update rate to avoid RCU warning")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/net/wireless/realtek/rtw88/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index ce65a1a80840..8e7ae747b900 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -664,7 +664,7 @@ static void __fw_recovery_work(struct rtw_dev *rtwdev)
 	WARN(1, "firmware crash, start reset and recover\n");
 
 	rtw_iterate_keys_atomic(rtwdev, NULL, rtw_reset_key_iter, rtwdev);
-	rtw_iterate_stas_atomic(rtwdev, rtw_reset_sta_iter, rtwdev);
+	rtw_iterate_stas(rtwdev, rtw_reset_sta_iter, rtwdev);
 	rtw_iterate_vifs_atomic(rtwdev, rtw_reset_vif_iter, rtwdev);
 	bitmap_zero(rtwdev->hw_port, RTW_PORT_NUM);
 	rtw_enter_ips(rtwdev);
-- 
2.56.0

