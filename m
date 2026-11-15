Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743775;
	b=NuPSAM/Q+UdJuOJWFqX41viUYXz4LrBXV7VtzpCCvGFZu+q2PQ30YutTq/AgH29Tc6Bn
	 sFHGSSGxqZYSuFwWAsEJOJOyQZjpVWzboqyFTQqg8xy7ScOQ5C+Nyiv/Shk3nCh7/LRK5
	 3d2WEgatjkTYdCe5w/gM7ic9UL6ojD2i80sKO13amytsOoazumn+QwbWZLyUoHBa7yCrD
	 EVQUCIGhHHE6OblInWTIu4i/skBDY8cVeft2cA/YsJyYJ1B4ZXjJgC2VXZ3Z5mg1Sel2Z
	 ogEmHOzcW7ewAC61nyC2U1FOUJmxWyr/rDJdcYGvu5OtaGGMuwzHW6McAjT5k+YIQiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hfpuaPUeNzYRX/a4bpteWtQm3HZVKHFNeVxpDys+fxs=;
	b=vnmZvqsFemHDT53l1+fy3SU73k4hoDDcgxqwldlY3ye/D9fZZcjrlKqodInbzOylsWpR
	 WBdNlWkz6+K5+iTnSDh6uB+1Iv8SWJGsHu21PqU5D+MtYagHQuLnWOvDOoB1rgJM4fk1l
	 66LyjGZ8XaGIdhFNnjmYoptkLlFF9TO0SWNk9+OATzMd2lsH0xS78pZ5LdfiBSyO2itpY
	 VF5ARpAsZY0VvmbZvM9gPSG0dfFpgxz8rBEm07g8GvJoSUUiEGUXYvavP6OIrSS1RHffy
	 7JGXW1R2bI4GEXxCIAHlYhlOsnwuSqp47iK7SykU/LnujMbmJ1HWiPHxdq95IjEJz5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tn9z7leD;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509C6606A31A
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 11:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 509C6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tn9z7leD
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso2719274a91.2
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 03:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794743774; x=1795348574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hfpuaPUeNzYRX/a4bpteWtQm3HZVKHFNeVxpDys+fxs=;
        b=tn9z7leDGheCOugWA/nznYEvtKxDfaiTWWpRt+sb6L8cX8DoslrAsdaNshDw1M3eQe
         LshUpqpL7PXQ26fkmx1M4FkdqTk5Xw1T90ahYfZZB7bCawPeDqcbNPOkChmZY3Uhw+hp
         vul99nQOgWv8Ew0qnhaAldImQFF7qqSAGMFqLFiiUtPpna2y5dRhq85lfCoZVFaHVfxI
         X/Th+7M0La+mFt1Swom/jBlVHh+XTSiFnnWaZfbiPYkGx1wBnGd+TrOdkjIZQK6E7MZ6
         2jc+MLYCn9zId6JW9vR/Nqdpbr/PjKLJtwnpgyPtx6fweEmXPxwZKrHqmHmfva9k7vIw
         lznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743774; x=1795348574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hfpuaPUeNzYRX/a4bpteWtQm3HZVKHFNeVxpDys+fxs=;
        b=CnSLsFLCdAT9shjB3Rf1S+3MYn0OBCDH4ukRRXw7WYa5M74SdfH/rW0+aDK0AgUedK
         SPBtkYPo8iEeYcvhblC68lF6ifsIosZHNfhZazSs59QNWiOqpp4i/t9L/HMJe9aPEcqQ
         i0twWwUVUy5NrAvKCVnnuAI3YnuBtLjBeNjt2DLBdL7JF9/CIXS2UmDaMiewXW24xfLa
         17X6Q457rMLqJJPskWxDpyv2JQ4nIz2SjIYlogRIdSds2MMuTBMP3yr/9iFn8S8s4j+0
         Lk1pTwbIM9qpm+eyqi9d7/l2TFoYGPF5hcBWZrvL1QluJC3e03qba0IIrwtjtaTu8p79
         3pQw==
X-Gm-Message-State: APuU4Z8+8ypNAJ1kKYxADsra6XNHR8UfopSlbjVtaB8Hllk297yoqmDG
	XVmKtXMxy6g6fWfexqlQfIDYMvqWkZzTnUeRw9y6qfC2fgoCAlHLxOdE
X-Gm-Gg: AYBFou1kWvy71zjaAhYuRNQHhStzDAmzuKNJlkfUOEDddLgJesBoOgY5y87GoAx0s4b
	Qiosd2EUDOY4jFyibnwA+PmFhJGD/Y3npspmWTJGTqGdgg95XxuTVxtiqkSGkXVX7Sgk1Nqh1Uc
	5B2VmtIp/yVVPND/LgKS/IuhI6dVVfNLmYvUbi7pbVLNOzJjx1MhKDAxmVzJsl9XHv8KKqKlNCk
	WodTWh7veK+0XrHJvWzNEyZ9UHS8fytwdp6TYLliqMT6pmfbeFIbRnGMFhASamS9e1Ns/0e+tVW
	sGNUgEkS84+QiI3wjqLDLPU9MuXEqsVz9zHN2xAPRYRx6Dvf3DbaeCQEyWRPtLrELB/bDZs18cZ
	MC5rddLp7ysGhw7u6ycosPpfT8T9IjVrLqgkRPRLsze8Og5LuI+Wqr0uEL9k404OHM1Fb/5U0p7
	VkvO8EiTKQe3AQL/uC2D3zZ84j9+NcY7yfTz6vpyv9TJ/Yu42YYER/1FgeY7AxLRZWtl461oxyF
	o4j33LPrYQQQdVoniRW6HtNWfg7BXflTJY7W7PVm0UFTlZX7ek6IiOse3DiOAmN4OUmp5yY1YkC
	MRbxW0SpWyASQMOB0c/zYkFiMEZXIdT1IHkDDhnierVLQPSK7sntcchDewcaV3gGcfhQbczVB0r
	UhgUD364u13c3H4q8pDnfc7P8jfZkYBsfITm0TvAJdjM=
X-Received: by 2002:a17:90b:4f44:b0:3ac:450b:164c with SMTP id 98e67ed59e1d1-3b1b0cf43admr7838406a91.47.1794743774561;
        Sun, 15 Nov 2026 03:56:14 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:5ade:5fb:5602:326b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3ac294bsm5853901a91.2.2026.11.15.03.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 03:56:14 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v4 3/7] wifi: rtw88: correctly expose beamformee capabilities
Date: Sun, 15 Nov 2026 19:43:29 +0800
Message-ID: <20261115114336.1739863-4-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115114336.1739863-1-hjf3108@gmail.com>
References: <20261115114336.1739863-1-hjf3108@gmail.com>
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

Make MU and SU capability flags each depend on the chip declared
maximum instead of setting both flags together.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index a8a603aaee..b0c338954b 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1606,6 +1606,7 @@ static void rtw_init_ht_cap(struct rtw_dev *rtwdev,
 static void rtw_init_vht_cap(struct rtw_dev *rtwdev,
 			     struct ieee80211_sta_vht_cap *vht_cap)
 {
+	const struct rtw_chip_info *chip = rtwdev->chip;
 	struct rtw_efuse *efuse = &rtwdev->efuse;
 	u16 mcs_map = 0;
 	__le16 highest;
@@ -1624,10 +1625,13 @@ static void rtw_init_vht_cap(struct rtw_dev *rtwdev,
 		       0;
 	if (rtwdev->hal.rf_path_num > 1)
 		vht_cap->cap |= IEEE80211_VHT_CAP_TXSTBC;
-	vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
-			IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
-	vht_cap->cap |= (rtwdev->hal.bfee_sts_cap <<
-			IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT);
+	if (rtw_bf_support && chip->bfer_su_max_num) {
+		vht_cap->cap |= IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
+		vht_cap->cap |= rtwdev->hal.bfee_sts_cap <<
+				IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT;
+	}
+	if (rtw_bf_support && chip->bfer_mu_max_num)
+		vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
 
 	if (rtw_chip_has_rx_ldpc(rtwdev))
 		vht_cap->cap |= IEEE80211_VHT_CAP_RXLDPC;
-- 
2.53.0

