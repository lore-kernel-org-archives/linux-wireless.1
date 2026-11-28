Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886547;
	b=SUZeT5tWxqlGh3mWn+/VOdovOCydGXphhBNrI25Own7dcAXV0gfevSSJyYgogqBbpsL6
	 C99UqM2sddzHJ+Cgls6YwBVt1MmPz1uUTK56za1NEU4zIREotMu7lHXlVz8zPdrV5FOO4
	 kIBGi73A/eiO5Jz+pQGNvMcNua3IWhMprbOEIF+BWoXV9cTslmviDnFoc/fbBXJKYU95U
	 4NXUywXn75YTm7poXfP8yWf7eETiWLtk0wFXNtaM8PHaGXwnf7ybu6pi4UAqBGV63K+In
	 YIdSYK8YTPBNQEbXoENopDPYApgAOsDMXRQUQUH/5jc68BoTn3n8GJyN70pqMO89H3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KclniKzng5yC2OmTSrt2pbDLszPr3jSxN0jyx81WHng=;
	b=JyCJqNyVtIG+pnNINvaxaJG2eE61TvwHlCBcQqB6LOGwtz7Mg5Ho2Nrc8vd0Rp/7rNRs
	 jTCHGDH9bIHEwOfVwUmDGQLSrB+n+aeMTNU5ZPwlke+OOLq3jSEzdMYdzHO5uS7+N/oYW
	 ey9mZkpeBJ/eygx5WMRzBombzOjU48J6ryMVQ0Syhjsj3uE6ANSrdeCyldCeIPakASGiJ
	 q7UXJjs7iqrzscXgiSy0bhYymPX/fNVCbe2hRaVbsh1nH8wGRD5EPNh26UoNwM9QBdVtG
	 w/DHauNnzF/2+u3UyypD/NAPVHa/sKL0wXYUCVwoel/FrL/O0L1EV5mtMK/gtOulXlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=zz4xOAmX;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FACD606A69F
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 17:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FACD606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=zz4xOAmX
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c516a1623d0so1071678066b.2
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 09:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886544; x=1796491344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KclniKzng5yC2OmTSrt2pbDLszPr3jSxN0jyx81WHng=;
        b=zz4xOAmXQNYV+2+x9ob57jhu33PWTfTPaAIhwIr6m7SMwI4t+Cl9VfYUkmhdbzoypc
         rJMro9ybX2bdbZWPFOM3/Y0pdDK1P2wsDZaM5Vy0tAFkkU5/bIZG8vHMk9kTTwUxe96V
         oNTRqh+BcQCPe1u1/qN8KPsDkWbwoLZrB3Y7mj6nJsd/FbpN+EWJg+GnAL4e9tSzda+7
         PoLp0aW+SEA6J+suL59q4l0yZEaN1I6wXFn5rEntEOsa08X5yHnY4fH5BgF5Fju+l2EV
         bPfqR7e9ahN+BIhSqM17K0ZRRDC7pxaYsGjBPMnW+NQQJ8tDHGUeOzERmVj7m6vUcMap
         EGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886544; x=1796491344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KclniKzng5yC2OmTSrt2pbDLszPr3jSxN0jyx81WHng=;
        b=icto086Euy+CPNlIjDZilMifkeNSknuolnhBoooNQigydcCWReXsv3YRnmmd5Mv70c
         BbyzS93j9RPg5yX4Qh6x+PYkLdFZ5RyxuvRQBvcwxUjhiBSBsXtcKNVwlxeycKqrozc7
         SqmKlOkEtnJZwEDPq1oYhzG1GihPT6fhU4pXb8H1urpF+6lzWfyAfEvHbQJ/FiHFmvL+
         0Bw4sKkkQCDxLBuK9u67EPbHcHblPjajqLGqsVp3AViJy3pDcE9qPQCK3XZBa6Y9fFpO
         93bG8aeFuo/42tpt0KqHdSSFFoSaHn1XGT6c0yCnWvCf0EHnNe91YT2NpFQbQ/rL+Gac
         kqLA==
X-Gm-Message-State: APuU4Z98oTnaz9l1NlXrPZN1vLyN+59a9bpGolHerWDYWqc+xkZ6w7iL
	3Ji6CqdFaC5O4fpLTEX2xZhsCZv/Hgxof/cwcQncp6ZfuZVHRJmHaugN/q6u+561gQ==
X-Gm-Gg: AZFdTZcTc7CG428ek3EjBZog7rsnyTZ4zMIB82edYlXdxiQG+m7CKh/Y8Ekvq2bPEMd
	Wc0Eedx+CHPexse1A4cfMOiWCNlNax20Q4OhIbJkXSE73BW2Y2S5gK67EU1lrhgQdQl+ThyznbS
	+8H+6ub6j5WEK6NXX6kFW01pvL1TwqUgr8Rqj78fRPoi5YXkZmYpDo3+rzKBt8uQtoUeDheuRQP
	+XHlI5ZtLYi4XLmN+hHQjJctkpLyTZE0lHoP3Twimp6LJTDVVoYIKaKRaER7hKdWKLpmCSei6OB
	3x39Bk6p1N4edTxiQW6wuhhnh/0G7J/Z6kK4f9jh1UjxgY2b01tMjD6+K2XMeoj2zgv9QsEcgT1
	iK+ONSvn3bzkTjsb8adobzTXmpRt3tZQ2pir6odC7y2MnDg4Hfu54hqsQKgaCBUQWQiMp8vBJHr
	e/S8NDS7m6NB9zjdO9ZYGqn3JRYDN4XZwTN4mmr6zG3UbpI+VjgB9/CDSbXPmxWWe3vS9LE/KRw
	gAGZpjhhYAaiOLOsDpDbXbmpKBKdD8Eafdh+xYFxLsKA98ha0JkGO2eSRgAbE+roEeVCdlm6GPp
	SHr/b6IT7S0VMIN/lnfrUezANg39TyRu8+bbLmK8vS58pVX34QTKVE9IFxMckQnf4htgGgSF6Jg
	JpnIvawPCASzhWNYVj9yiFQv8cy2uEckVgyKCiS3/GCPqr6DnZixFtoiPEOjIvEeDnrNtmsKr63
	a0AhuROSO3TbnQxOJKI0Ivq7S6fgFUAOI8DPgFMixxlMUzvSQj9t8q83LsE80cla+rUWcK0CNUh
	M8VNaIfEi89qGdjYXwz0CYJhh1eAGhBWGfDfajOruzCo/IiHvIBDip0kYd7tosIaiR4Hm5494we
	7n0h+uPor7+erA==
X-Received: by 2002:a17:906:eb56:b0:c40:36ca:9d1b with SMTP id a640c23a62f3a-c513aab5575mr1784407366b.40.1795886544488;
        Sat, 28 Nov 2026 09:22:24 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:24 -0800 (PST)
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
Subject: [PATCH ath-next v2 5/6] wifi: ath12k: clear the crypto flags of the receive status for each MSDU
Date: Sat, 28 Nov 2026 18:22:19 +0100
Message-ID: <20261128172220.922376-6-julius@bairaktaris.de>
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

Found by an LLM review (Claude) of the code.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2: discovery line reworded.

 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index fa591a03ecef..e37353445749 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -414,7 +414,10 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
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

