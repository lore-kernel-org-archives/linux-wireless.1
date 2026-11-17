Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935411;
	b=A9oS7zrAbth9xg3H+VmHNT0iwPEtskJwfVGdOgBoAJNHIkdpe09PLEaN8fWg9U+2S4E7
	 laJov2VhH12uTOUVsXNJNItZtA76FfrnSR/l4zLkUuAxHjp+mEDVMKa4mzP6BzdGeHAJs
	 H/HpliKBR+5UPwkQbG7lOcrgOQtWgh2fujXy1y4QEMnR2+WOe0ucnAnSlTdw9mjmKWNc7
	 4BjlIYgzgjixvizkeyo4mnhhA/AGxMahs7lLurnyfRoP4JE27vQ7sU3OvdzIFHsiW5y9X
	 wEf43OGhxOqL55KRXMmxZlXhtwG7sVLiJOzUSpu9FENICQMtD4dNZbtNOgsAkgpzW8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6huBfZmPJQPrAdDCa5Wk9xqnE2GPx+6fEpKq90an7Ag=;
	b=q2kRXOFeNzGQx2Ap0POao8Zr1sxNOM2jyBw1zgqFqxUAc12p3F2lu1t/XXmYunDzZKCR
	 fSEASH7VzHquWPrRz6aMRgaOSNSNppm2kELtSxcFdYDR0gBEr9Z6XHkkRKe2JpgDr/SbI
	 HLB149h4lXUR3dbJYCNhEH1ej3PNx8GoYi19S/rLVkt3o+M2kDkrhcDmok+z9Sonh9QNJ
	 F1y4gidGKyw1GRij7K0ApSCfM+SYRMKkTf4wiZMNpHd+FUdA+e2P30f2fV9TSocL+vLl8
	 rxir/KLNC64CKWfWhXNjfQUVZJzlfz9MYYdL6F0TbCbwcsIMe0KKYp91/al+B5c2Yiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ntofaL2f;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F5360A2609
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 17:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0F5360A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ntofaL2f
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso2106170f8f.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 09:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935409; x=1795540209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6huBfZmPJQPrAdDCa5Wk9xqnE2GPx+6fEpKq90an7Ag=;
        b=ntofaL2fBYzCjynF1c8NmGqctSSh8ulMFmY9Qxcamd4g2662lO1CL/51dKeRj4sIzd
         asq/X1ettnzwnLTW05VhRM3QFS1ZqSI5yrs6CBtpOiVueImRsrmAWS4DtkFRBmS5o1Vt
         Ut9d3BnEu8iRJfiGiv53rGggN8yUmKIJeeR7m6lc0qWo/LB4SU/J8JoJwLh7IzhBMHfp
         nUv/raSDFFneQmY+YttiZio7ZvYyM90LghW7P6qvolJO74knLhgGCCoIT5elu3kSj3B1
         OK66m+1MhR8zEny+qXxObduPj9ayVgNOoANAGLpWHtHlzBv6I3D0vTqVk56N0uAc7dZs
         7fuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935409; x=1795540209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6huBfZmPJQPrAdDCa5Wk9xqnE2GPx+6fEpKq90an7Ag=;
        b=B67AO63HyujOxz9Dpya6/PUVCpwHNBsaTv75PZcqnZTTcNP0OkdLQVsuxiuApZH9BN
         E/OYVl07L1Z7UK2mpkskeT10zwTys6QMNkVJZtKIh3fev6sRDZ1PoWkaWQ/EZZgfmx+F
         +F2a1iGbePRXdsjW0NY8MSbocon/6vq36RQ4VO12669ncMzZvTsP+3DVLgN8ma9NUZIU
         maSa9kfG9RHB8CUzvfjE09l95qb3afM2locSfQythukLhrOflDqHV4E7s8HsLQvwOaQ5
         WbTvKNz0La0b1jvz+gKc9c06zv61RfYU7tPon7Gw8sq4zRPJ1UIagHVQuN65M2WnEihx
         V0hw==
X-Forwarded-Encrypted: i=1; AL+hErF+n+tfYemfl4Ya6AEFIGbXWDfX92IJH86hLLnnP6KQHDGotj+5edtVXoaisbI6uXMlv8RMgErOpijENju/RQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/panlf7dQGz7qIDBxdiX4MAFGDdvESKqhrmv1WbFexUUp3YI1c
	7jg0an9Rb3SmUMeQFgInEgsMsgGljbWwPRZS6X4aC8bmYz373Z69UPJU
X-Gm-Gg: AZFdTZeCwCthQtfOemirvajN173lfVCaCgqSeOCFPOIu6WChaRA0cjkF3SscTBjjBcU
	3CaMuZmWWP/5J81C5yTphmdH/3+OaCdRO57ykdpBCgSsbUOyxh9ghYoEQDdxdmPdSTh79cBax0G
	nFfkj2zpb4N3YOo0XQNc5+6IlLme/UTFJXXEtfEDSmZpeHdZYrxz6fcCC2MK034c2UzeXrjx+tg
	S8OuoHdGCe+1UUYDbF7nKHk/wweO5GqX4330bOu14cK+8wEMGIdewvOZaSePRWAOYOtnRyCMnju
	pWR5yQaw4kyRzDiVsU0xEMGEnQyvQIAygia9UDrQfVvQchsifj3FAWZLzFcBYt3X0qlzc8njPpt
	R9tgoFqDNSX7r95/qjLFd01XT94Mz8nWMQo9VgZjplZcC2OlyWpJwoV9w4QAOQUP6ArAbnFuj7R
	YL1vbuG6bowgIqnOv6zUoeuMfhjhYez6XlCp0bsQWhVeD/sYD9yFXPu14mERWR3bw0BMWgbJLMA
	RGpqDJsaEc7oe9TLgIwBrwCFzdGwaXThz0Jy1l9pGHlW+CjSxsyEz5sLXlI5qiEvpABi2umAUp3
	sBl4YTWn9NGOifSlS0DQThQr5UlJKE9OUk0=
X-Received: by 2002:a05:6000:41c9:b0:492:b1c5:6db4 with SMTP id ffacd0b85a97d-4a63bbc379bmr82062f8f.26.1794935408907;
        Tue, 17 Nov 2026 09:10:08 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6d079a2asm26828762f8f.16.2026.11.17.09.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:10:08 -0800 (PST)
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
Subject: [PATCH rtw-next v3 4/5] wifi: rtw88: reset the stations outside of RCU on firmware recovery
Date: Tue, 17 Nov 2026 18:10:02 +0100
Message-ID: <20261117171003.1840491-5-mehmet.fide@gmail.com>
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
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
---

Notes:
    v3: no change; the station skip Luka Gejak found is removed by the
        previous patch
    v2: Reviewed-by Luka Gejak, no change

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

