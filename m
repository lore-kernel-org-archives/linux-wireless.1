Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795381534;
	b=1VhvPeDthiMhU1A/QpQIlfcJB6Gq03wKqwJaWFA8Fq73umzc+rWDMxqBXTJmxZD/VIuX
	 rxsWVX5J2nNp1J59bL0QOcYfp2N1tQgxbnX2gX4cV9g/dVJqOcGzB102LAs5zVbI8HR06
	 8cg9OeEATqW4Uzy2lzNdoumgnOAczae0KWxzg/ZadxtJ4OKez6LVRhlgI/cu2H8Yi2a4u
	 ZA3HNSzr8F7n2y5ylGHFTKT9nZM72K86+L0zQk/orI4ow1r9M00mVYnNrgDgmQeIiTA4i
	 kZwah89mTJJEzSH+sl/34tSTQyHcvIQYVUh8mvuou0G9rRd4yHgta64oo5uT0qjhKTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795381534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Sfonz9sz93lcK5gtS/Li+RwUHjpeRem/YyxXweufjn0=;
	b=YScBrNtAtY10aEIAn/9D+WjZT7rSXuAICNB6AY9eYUSXe6ZbtMVZ1Ts3JKBIHB/jj53k
	 UmHM0LAXIIdWbM1LPG7SmpbicyEh7wnNityaIW+DJvTsemQksYnlcjdJP2YQX4abtnqAO
	 WgVOFuLu5YAbQ/FTr1BCIC6//LsMSozqnhaKtOu9BsdSfCtOzjGzUoRZuZfG+7Tmtajqt
	 fJJrhYIrQoqm9qxDKuOJd0p7AyJn94SoqRJX+3bL+aUU9O22rjSCl4vyJREQ4iwIAj3Rh
	 LevfVAych+UcspHgAbK0PK40luEjtZQlT/mz8YL4V5ASJ8jd74fupFj/YAld1T5Qxvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Gd+gO5Hq;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50226606A6B1
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 21:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50226606A6B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Gd+gO5Hq
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4322d310e7so467910766b.0
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 13:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381532; x=1795986332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sfonz9sz93lcK5gtS/Li+RwUHjpeRem/YyxXweufjn0=;
        b=Gd+gO5HqqcCuFR32X+85Ydy0Qi5kmm3KErC4ttV0moc5Y/10hlYXNxrnB3Iut+Cf/u
         xHklT8nv6iZTQ8NnwemSf7KyihF6vzXad/e/m7rKuBwAlvEBLHscDiggZnPMqJZoSfJx
         J7Z6yVkRFTREbwrIt/5ljNB7hP3QZI9io8lFeDffsDzd5RNPo35A11y/P6zUj1+JmuR/
         C4RGOdt17NS6xGE98diIyH/zNZI7iiLQ4m022bBMU4BYt34oSKASY1fQ/xX8l5pPfGSB
         kAtQzoY7qEbY+5cAFRwXQHbCGVR8qQc1+DVMi808Qs1WzM4w9CAVWXjs1w5kH0ARq0Q8
         ylOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381532; x=1795986332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sfonz9sz93lcK5gtS/Li+RwUHjpeRem/YyxXweufjn0=;
        b=OCS/tvZ4YMzbpPdjipVTwvLjHjet5IKnYgei7y+aZ4kndSFn3tMtsn8thGJnqXnw78
         r4VvHT1v3X/xiCoDu3pnoFQAA0QZYPhNlvXKWv6Sc9nno73JLk7vNWxsY2Z3tI0mHIll
         hxkxYcZQ/j6lspfyKLHpJ6LwZc7vxZeZxNAETONCWS5+vHYWjzjRkFxL/oYXDc6VFUbK
         JskhHeG25kILQrbQBXk7MssYpP5MghJBH6uUaYpNby3pITjnUC4/03pP64zbGdW8Ag2q
         0ARqUzgtr+gwYJqzmozmNszoGNECrQrh13HtTvpEBYlsMo+gWOh6HVZdi2qZWNAOIU67
         STQw==
X-Gm-Message-State: APuU4Z/RXsrX2e2CZcbenXTDzAnO9icvQCmrHjAYeFH4t++CZ7jeadiu
	7eqyCu78B3k6j0DFGlkDu6MGPFtiW4AqdmhFQ5s0Pj2yODSQ9SuSVBa/uH/NZ7Zaog==
X-Gm-Gg: AZFdTZcMe6S1vrWsdBpLxHRp6q7JHFgoxAY5t09Twz9sVtCLkFcKdsOsFhIuraZglyp
	6Ristf3YEff13ZSIGJMo7leeF8cjwC5KQ4LD2HsjYZMPV95YcL0JzWf+uFr6xoONTmeg64kHc/X
	g1CJuE5RFrPIX8X0+GJE0dJ48DhHw2U+07Xubl6OAPX6n4iuffYbhLc+bRihdXO4YGXCSPV3AjF
	a5bFoL/3/TtzZ3pDnhldGakXh6vpoBc/YShRO/QHVPnP1UTn/73W8MI6RVGahgr4Ed11GriqdNh
	h2MOBMzuTXukdqvHIILr8kGkXUQjWAot+/D/rvitpkCJ7NA2mYJBVzHtJt4fs+gXYcXvgZHiNcG
	ung+F4mbBuzVcuqP1rldNZDiJU4w15koF/jT0+u2NXynreM49pN+OVA2YssMOyVUBeWqpBoIQzI
	7ScK/Gg4BWKaQDJEB7WvQBK45V4VQK1ihstwIV6labckzaLcdmCbUAvYupzWsNLO0KB+HgHQ35v
	1oPRfIJUyrNmXyA73xbNRuAT+aVF8Gz3cjrFcfASUlMGZFkEoU/SQGMHzK3RUbDqaPih+277UF0
	sspMNxFqSmptMWvcEkp9E0wv3/GX1JYLKX+S4uj9TUwCtk0IJVF53617QjJuJrGppaoDpmfV7Ak
	MBcjUEClm3os6cxxmruJe1f3xQvTIKPcOPNG10GnSnggd+0FgAONGeOKPPX4hRPQH7z78B79CvG
	NaMk6kGWGRtXB2uh3eWpSZ3AvL+pSGrpYR0CRDrR3YEdyrR2Ej2VCKktXIdqW5KuO3/s7Nc6OfR
	0AWkLsqZE8EPiqhUzGgd/no3He50/frXot4ply9gzisTOi5HK83v5oB/PUzLRejlD3jnRg723s/
	UoP2ogzBVbesKyv0CugcJr6nDVpiPnw0Mhls1XmTvVVV6ypBWbb3uA9L9q3k3b1TeMO6wlTymA=
	=
X-Received: by 2002:a17:907:d1d:b0:c3f:8c92:3b51 with SMTP id a640c23a62f3a-c513a47e325mr894924966b.4.1795381532562;
        Sun, 22 Nov 2026 13:05:32 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d300ad8e04c1718a6e78.dip0.t-ipconnect.de. [2003:f2:4713:d300:ad8e:4c1:718a:6e78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm339935766b.57.2026.11.22.13.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:05:31 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	John Crispin <john@phrozen.org>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Jouni Malinen <quic_jouni@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>
Subject: [PATCH ath-next 5/6] wifi: ath12k: clear the crypto flags of the receive status for each MSDU
Date: Sun, 22 Nov 2026 22:05:24 +0100
Message-ID: <20261122210525.2076058-6-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122210525.2076058-1-julius@bairaktaris.de>
References: <20261122210525.2076058-1-julius@bairaktaris.de>
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

ath12k_wifi7_dp_rx_process_received_packets() keeps one
ieee80211_rx_status for all MSDUs that a REO reap returns, and
ath12k_wifi7_dp_rx_h_mpdu() fills it for each of them. As in ath11k, it
clears RX_FLAG_DECRYPTED, RX_FLAG_IV_STRIPPED and RX_FLAG_MMIC_STRIPPED
of the MSDU before, but not RX_FLAG_MIC_STRIPPED, RX_FLAG_ICV_STRIPPED
and RX_FLAG_PN_VALIDATED, which it also sets for a decrypted MSDU.

ath12k_get_dot11_hdr_from_rx_desc() drops RX_FLAG_PN_VALIDATED from a
group-addressed MSDU that was decapped to Ethernet, but a decrypted
group-addressed MSDU in native Wi-Fi decap that follows a decrypted
unicast MSDU in one reap would reach mac80211 with
RX_FLAG_PN_VALIDATED, and ieee80211_crypto_ccmp_decrypt() and
ieee80211_crypto_gcmp_decrypt() then skip the replay check of the
group key. Whether a reap holds such a pair depends, as in ath11k, on
whether the firmware delivers group-addressed MSDUs through the REO
destination ring.

Clear the three flags with the other per-MPDU flags.

Found by reading the code with an AI review tool.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 4a57d89669ab..fac60041d3ec 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -411,7 +411,10 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 			     RX_FLAG_MMIC_ERROR |
 			     RX_FLAG_DECRYPTED |
 			     RX_FLAG_IV_STRIPPED |
-			     RX_FLAG_MMIC_STRIPPED);
+			     RX_FLAG_MMIC_STRIPPED |
+			     RX_FLAG_MIC_STRIPPED |
+			     RX_FLAG_ICV_STRIPPED |
+			     RX_FLAG_PN_VALIDATED);
 
 	if (err_bitmap & HAL_RX_MPDU_ERR_FCS)
 		rx_status->flag |= RX_FLAG_FAILED_FCS_CRC;
-- 
2.53.0

