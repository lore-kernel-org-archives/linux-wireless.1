Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297721;
	b=Dcdti3UEesxcwfjy53keHAxpyKJnnlmhj4MQNp/7S/AzFGbcVPcsw5qFfFYOvRLYNtaC
	 w7pZ6//+tftoXAEpzDWiPKjpyEKiXva4K8xgrbw2ptLSFtd252rgYPnCFypgO0efvGJZl
	 Did9kbgdqhm+8Am5EZAx8NeRKKS1BGwqq57VNGBNWDOFQbGCyC50aCNAhNyJor/8AJ8bN
	 1RPxyXi1pdKDfGChSQ44YQbU6/xuAnQT6GQKe0Bsc4OQbhtTUZOHDz3hGOqN5BXqVO98D
	 OJCtLNoeDNgwTLubFqpVgdfvfKLTfdotxdcVtEa/QZkmFR9NzVXM8ZomBHxdSWwn/uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OiJbUJ5l0jctc+MHq3ejBCQI9uvcTD4H/eKMo81Oa1o=;
	b=BzXwZhj0f0lAu74sqvgnmmbelCu5LGxzgaCyUodE2SnytPBfMKM9APNtLk7U17+rJ5r1
	 OoKdAj2sludE3oEXC2M6iUxv15y7sZVZ/PQnuRCDCN4B+x6MYpAvAG7MzZZpl0X71v3JD
	 P6byVX1YXV9XPMwwt+v0vq0RE5Rt4kZsiP1jf4rjCJS0XhRfqPL9f4YxH+HmSHRXDiUCF
	 9mevP6hLlm/foTO8qZBigBq5Tr2bG0w1MavVlBIPqDkFeIXn/elAG/yT9ljV5EsglaT44
	 BK19dlkhZYs54PluBw/JdQNpzjjsOo02L6ncVocSSHP+lGc0hwjg/ioA6qbNSvrXETA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jA3K4nR/";
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2F1606B13F
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 08:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D2F1606B13F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jA3K4nR/
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so684438a12.1
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 00:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297721; x=1794902521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OiJbUJ5l0jctc+MHq3ejBCQI9uvcTD4H/eKMo81Oa1o=;
        b=jA3K4nR/08GXzFRGQ1PrEgbALaXclN05Tavtme60Zya1HnVAGd7ehwPLwZAIb9Y4Nv
         inrpY4nrmk8xGqWyJ7Yc3s7L/auX/ODa11jhdXhYThHI2ZAZdr7+iIKGttFMG9pjomO8
         zYLuAVazU7qJAY4NQ6R5Rkfh6PrhJDBhZTExce6pgWZpxyTvOucDkLVqbwTICrCfsCfc
         eQR4T2LHT7BFBcaQEopc1Jctt1e50jSue6AqHIFloA6b21Y6w2wu+uYav1FH/QIuBLVR
         Zfny7eIlvrDPd0nDKAznBrG3a7rHJHk2lfGTV8zXBM4ODN/2vNk/MsTOkreE3B5PJbNu
         E6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297721; x=1794902521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OiJbUJ5l0jctc+MHq3ejBCQI9uvcTD4H/eKMo81Oa1o=;
        b=aqTkK3rqp7bC7IY5kH2VkUI8i9f6k6Fu1yVfaAK36KkwbTblZTL55+Ar9lOwM+uSDZ
         7wq/AuxfyJ5DRScjm9h5ChtT1agvpsJKsVZpBeMWgtp9RvKp/cEKVBEkTlhmeXZzSaUS
         xMxazpcZOWQ6/cvZChF89qoy8g8Tyx+tej4zVp0UDEbuT5+mEDV5oj0C4pJekatZAZIq
         NcuFEyh0ZxVaxopGekcR2Qhj4SP4dWkUeD+XXB+ckD/qHr/+a2Xdjx3yVSxyJZy6mbgC
         TpcydQEQDL77BLL/Z+Pq8Cc+WP3WPnmyYFFoUyRhha/6HC680o8Luo3iUwgbtGr8PDgQ
         pGUw==
X-Forwarded-Encrypted: i=1; AL+hErEKjMpnifolVsujRyBWXVDVBpeY3Shum7ZfOREX9eQm9z2hPCUZFCIx5iRnh/aLEFmynnN6OV46JH2aT4iWNQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/T98AHaJ9ni9liulyLwgC4hUKyJE2E9SNIbq/1KKa5KcDeth35
	O7GO5IVtXJJ5TLcjC1O2+wWSFiqotEN6kR5t+J+/0GfBgyBxR6Wj4T3Hhm7eu6meLXe46g==
X-Gm-Gg: AYBFou2vP0V/5j8M/i9350HxcKd40/AKnUUNdMuBBw06dp/EhWaj55mSH+f09Bl2Fkw
	YnR91lAIf0yq90VHQs9xIDLeohm0WiDFVmjHNsVwMJ/2ALG4u5mHss/0EVMEUdQ8MTttr73YIFF
	dVlqTLAImO/rFNwsvQjwYGL3QrLgxgO1mtXWIdbb31ccSJFJbySV1g47xJznvKSTtKwYsmEizY2
	8RVu8oym/uNGcBc1U8t9DswHa0/FifFQWpQuD/Iwl8vYzM2lY/DkcW8dETQPeB4PYRNwKvSTA03
	aBHdJioGGxNapI+tGMRYcE8EcYNEQNUYsGxARp84nUryQWFJ2wseIYduiGcsI742kDBLG2cAACV
	AAvs141jwJrGSzcziyFcqpMkOMaJ1zeF72CJXGzBdYH05F1R0KRHyY8MWxHNKBX2BV2EG3vPA4p
	RInF2Aha24rj91e7kdt1uO+HMTvVQGVS035QJM2/BT0DD+BpGBNqIH+42b4TiWgZVIryL+N9xbr
	lAvwoBDvW5CPeF9r2dCX6cDq9kWIVKOva5CCCVvU24sTnT4SuhpuPNsDbBRwyRxeUVCT4+0MjSd
	L0JDDFJK7f12B3e47Xrii7aO0p/lrjvVSDJIznF2rW6hRkGoVq60834BqK2f4SiHdhyjY3IavAp
	s5egchfIa/bt9wQ8JVfLZr8qHC6Jpdg==
X-Received: by 2002:a17:90b:314a:b0:3ac:8741:e2e8 with SMTP id 98e67ed59e1d1-3b166aeeff6mr2040479a91.8.1794297720830;
        Tue, 10 Nov 2026 00:02:00 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:b87c:eff1:b55f:23de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678ceda0sm2906627a91.5.2026.11.10.00.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:02:00 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v2 2/5] wifi: rtlwifi: rtl8192d: report no signal for frames without PHY status
Date: Tue, 10 Nov 2026 16:01:38 +0800
Message-ID: <20261110080143.1362021-3-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110080143.1362021-1-hjf3108@gmail.com>
References: <20261110080143.1362021-1-hjf3108@gmail.com>
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

Only the first frame of an A-MPDU comes with the PHY status.
This makes mac80211 report the correct value when queried from iw.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
index 9f9a344920..58f7ad4027 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
@@ -425,6 +425,8 @@ bool rtl92d_rx_query_desc(struct ieee80211_hw *hw, struct rtl_stats *stats,
 						     stats->rx_bufshift);
 		_rtl92d_translate_rx_signal_stuff(hw, skb, stats, pdesc,
 						  p_drvinfo);
+	} else {
+		rx_status->flag |= RX_FLAG_NO_SIGNAL_VAL;
 	}
 	/*rx_status->qual = stats->signal; */
 	rx_status->signal = stats->recvsignalpower + 10;
-- 
2.53.0

