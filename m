Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886545;
	b=smr5PO6TpMgnFY/EsZ9BFZWzH1YePCcBJEStjXfrOGgUKpclXm2TU8Q1VN7np6gMiEDj
	 ZhT3DEwHSWvusJ8h/NPgyHFtw7DnDZP4wJ0wAxL/Xt/lEdCzDcBV+jMJC90aU1BdhYfIn
	 CprNeYiotEp+iuvq1QhGKaFhg94Gjjqibe63f5L4eBwoJLxVJZDwv1UqVzQf4VLpvgRe3
	 Ho39s2aw5lP8aEG1vi/fBt/EWtAuXejw9h+UngIZQXYlKvA3ti5O3z/GXuj4r7oHzjNef
	 mSk3v5TpQpmRhfmvkXRfveoO3kSzXAltqlp2Jr7UKWzaMHvxtp85lJ0z99rhqzKfyLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z5Vrk1NamYvHsdPTKlCxcj9SSbrY8eS2EY9Q9H61SH0=;
	b=LoG3fIUKrnP9tjjy1iABABaS/qTW/Xco1PZDqeJUsFBLGp7o/B8Hab4tTb79/bnnrU/Z
	 CdK22iUr9+331aHZcmDaoGeavx6yJW20wQik+94W2LDvjZBzYOHJqsbeVMC+4BDiHg/V+
	 Gh9AjQ2VqXMXfV2opqYWvOOlAH96YuoHvBijTAc7jntlV/j1yQYvVDVD6jfWlNw2X1+aT
	 hOUCW8XRQHo1RUfJg4hg8NlFSwsPpGuNOw78kmu6gmhaVxtMg2FyF5nDGuFnhNLzvkrq6
	 G1SmiOElLiTQE2a3YSqeIKMO2x6Qx1oEaI5ThjTVHLtJG7rsSzngnnB458MzkI8Uzrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Exm8y9+y;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3935F606A691
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 17:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3935F606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Exm8y9+y
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c516a194350so435492866b.3
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 09:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886543; x=1796491343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5Vrk1NamYvHsdPTKlCxcj9SSbrY8eS2EY9Q9H61SH0=;
        b=Exm8y9+ynhuTQoJHe69NdeFLgDUJGKHApGkUjF8ImIMNEhtKnIzmGZdIihXUb+EfVY
         4d61Jn6zLOoFC8dQ71WEJK+5LJDjFSnCrfKZiA6FlmT4cx5HSV4+z4cHPSrsugW1l4gk
         Z9uBoVM66nW1FNKVSzZLruDUCv08wQiVGjCFNhcYT7UlSRgY80vaJmN2XPMAIyNTVvNn
         KmeVzt18YsgFIPSCEMrQa2ahj7siMgkmhGKKbIHOFkz1qobdKBOWcZi4vylaEs5FSWRZ
         k0BwUO7hA/q7R7lhY7jNBnjExQvpPgCB3rlQ8AvuW+1VOHfMC3tSBqj4HcMtp6z1pgEI
         HyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886543; x=1796491343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5Vrk1NamYvHsdPTKlCxcj9SSbrY8eS2EY9Q9H61SH0=;
        b=gWeFIobZQpVcpQtXFwvBW2gQ7YBWAvwSJFadXcTJbJ2aUJ3dOH6h/XlD38PQRaaOF2
         FTL04L4ZVH5KgQg9TmRHC6hew1ZYilF3uFa328SHuufFKmSR81ryeQ0qkusLEtQWInbD
         WZfyDeY4lUPtWxW0x1WGptcEnjzU7//6IDL527dpgk5ui99RNyWaVwG2TbtVrsUuxZo/
         c/HZvf37j1rqttFnc41wnl+MicOQ0RsnMlpxA7d9tnpHk1NwAeQKgoAOAm6NuN+iPts4
         Rseu3gYNyrxb4VhqzOoKks6kynlPZ4hQQ/0OqL8TaHdKbAnrdgLAh/THbUNrlO76xSOH
         y3oQ==
X-Gm-Message-State: APuU4Z9eMBqBSux8TpT7hg7hfDuZLcY0X16Bq6dpzOZPORhy5fghl4Kh
	DZq6lPRRK1Z15Nh5CKxKuhajrhDm+b9miyyuO7f3BM9NK/2ZdydKMuurpCBP51+Syg==
X-Gm-Gg: AZFdTZeWyJ0GU+hjaTi+QBiCAU/F5Q1O8Jm0EbhIvEU9vmtshGLgu4qCaBlPeXH55UL
	7Pg7DFO3HHC50Jch8rIhA4lJBAQinUJNckJVJU82ptbKXok3/CQuvlVoDTc5prjZEa2kAy/1Jaz
	QUHr5m+BjIbp3ugICwDPgSAlejQKoW7vnxdhVUMk2+LKj8Urac1Nl9zFyplPH6tBfnQMIE2oNMY
	aKe8Yk6X+4u+Cx7aO1J73Lx4hDJLdc9tS6QsuXDCdawqmcM/O3FQsPRIJVXcShjQYfj48EWq+S5
	fByX15E9peFeBgfUK37/HtifzlSW4MUODVNev/QKUTWv7hk5oVoAgSrWq1po5IHz5VkiLr4nDf5
	ApJX65eYa/3y/xmrOSNiJkraSNqZSUCZBBBD+rENT+L6+q2MQLGsNBjZ4nYrp4U1VMefZuKtPv4
	tlEgtayfPmYDZj+dvOj9BlTNLZhOMgOJMt8Nr/PhNDpkXOmhMx/kuwWyMknnahq07vs9F9aGdEC
	r7Mu8LyrN0ZVcPa8/KA26FPl1uCX/EVR/wdP2LAPq+JXZ4X0HYi5ers6u4GKlpauXwWQB4Jdcpn
	S4A3QTBkwdxCxE+gWUoyWCPPbmRZkpJ9pGTUVGctGsC9EAp/GsaUTwyNU8jrMPtt6zxJhVSNmed
	tCYLQvw3j+wMvXhEUgeddcXGFBIWrtkbAkhMKSFFDLMbJFUhKrZ7h07cys45gxz5btzXILlExRY
	/lSb+Q5TayliIMjQku+sfNvGO52PKV3CAhKUk0vyq2NZur4uIqz822Kk4JcpEIU0fhllOPTR8EB
	hMhEB/+Q4uJLmFSzxOngf5XU9+PZvNuHDJIPHXxW6xrGMgYFE9f51IJN7e5R8cwYhs3enL9aq1C
	jHkI5TbiB5MOAw==
X-Received: by 2002:a17:907:2d13:b0:c50:ca93:19a0 with SMTP id a640c23a62f3a-c513aab9bcemr2391973566b.40.1795886543561;
        Sat, 28 Nov 2026 09:22:23 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:23 -0800 (PST)
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
Subject: [PATCH ath-next v2 4/6] wifi: ath11k: clear the crypto flags of the receive status for each MSDU
Date: Sat, 28 Nov 2026 18:22:18 +0100
Message-ID: <20261128172220.922376-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128172220.922376-1-julius@bairaktaris.de>
References: <20261128172220.922376-1-julius@bairaktaris.de>
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

ath11k_dp_rx_process_received_packets() keeps one ieee80211_rx_status
for all MSDUs of a radio that a REO reap returns, and
ath11k_dp_rx_h_mpdu() fills it for each of them. It clears
RX_FLAG_DECRYPTED, RX_FLAG_IV_STRIPPED and RX_FLAG_MMIC_STRIPPED of the
MSDU before, but not the other flags it sets for a decrypted MSDU:
RX_FLAG_MIC_STRIPPED and RX_FLAG_ICV_STRIPPED for a group-addressed
one, RX_FLAG_PN_VALIDATED for a unicast one.

A decrypted group-addressed MSDU that follows a decrypted unicast MSDU
of the same radio in one reap would therefore reach mac80211 with
RX_FLAG_PN_VALIDATED, although the hardware checks the PN of unicast
frames only. ieee80211_crypto_ccmp_decrypt() and
ieee80211_crypto_gcmp_decrypt() then skip the replay check of the
group key.

On IPQ8074 hw2.0 with WLAN.HK.2.12-01460 this is not reachable: the
firmware releases group-addressed MSDUs through the REO error path,
with error code DESC_ADDR_ZERO, and ath11k_dp_rx_wbm_err() gives each
of them a receive status of its own, so no reap carries the flags of a
unicast MSDU into a group-addressed one. An ath11k station under
unicast load received 29011 group-addressed MSDUs there, and none of
them entered ath11k_dp_rx_h_mpdu() with RX_FLAG_PN_VALIDATED already
set. If a chip or firmware delivers group-addressed MSDUs through the
REO destination ring, a radio in range that recorded a group-addressed
data frame of the network could send it again, without any key, while
the receiver gets unicast data, and the station or mesh point would
accept the copy.

Clear the three flags with the other per-MPDU flags.

Found by an LLM review (Claude) of the code.

Fixes: 2167fa606c0f ("ath11k: Add support for RX decapsulation offload")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2: discovery line reworded.

 drivers/net/wireless/ath/ath11k/dp_rx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 516856c531a9..9f6872f2c8e1 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2376,7 +2376,10 @@ static int ath11k_dp_rx_h_mpdu(struct ath11k *ar,
 			     RX_FLAG_MMIC_ERROR |
 			     RX_FLAG_DECRYPTED |
 			     RX_FLAG_IV_STRIPPED |
-			     RX_FLAG_MMIC_STRIPPED);
+			     RX_FLAG_MMIC_STRIPPED |
+			     RX_FLAG_MIC_STRIPPED |
+			     RX_FLAG_ICV_STRIPPED |
+			     RX_FLAG_PN_VALIDATED);
 
 	if (err_bitmap & DP_RX_MPDU_ERR_FCS)
 		rx_status->flag |= RX_FLAG_FAILED_FCS_CRC;
-- 
2.53.0

