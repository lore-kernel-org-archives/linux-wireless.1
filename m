Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371107;
	b=hBbEPqLlRIv4qAn7+1QRwIlNmEKzOcBjPAUB70u14gMaQLVrxEZCDNWae1kys4MM0mHD
	 hV6I0R7tAGdFg3bLh5BQZk/zu0Q3IA1oaa5gSTY74g2GcIh8qovyv3NGXpdc5J/AgKwCi
	 4/OCH21xst+MK/bEyOsqZ6JiSJ/PXnBhk/BtEXPT4rYKu9VuIjm1PNGHrDQk6gBTpmQCm
	 kxeY47pziWjE3tTxcsZsNTUwOzoeCMgD2/1IMMAqrh6yPX4mKRRd3c/asvGjeqyD/jDq/
	 UPSWgbYZf0Oa/7YY8LdV8IpGukYchuqAhItSIVWozh2g7NhrweH+Im7DoHUozyNb3qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VbRn6lUIefHO9idsi1h3mMXbFeQtqB3zWbpoKodoBns=;
	b=vWAc6Fnb8SI5yN9KhyhKGpjyqqvnMy816qSDbxnXCVqFPrbyvLJnN1u7qQ73SsNUuAkg
	 QimFIBbnDVVDoyKjeE7NHbocmRV76kfJ7zROWpebGhrjj3o8oHZyYR3/cuTpjk0Gq+3hn
	 7jffDs0SPUiEGpo3yIn5nBl+liGlrphiUd63e7aI+aPYyj4dzSOqQuT+xnM/jpop6zdka
	 nZnau3GgeVmGdZ6w35hlH1cD3Sw0JuleKJt/uRMOMnErhj7m2JAIX+9tp28NZPKOKRObP
	 f4OKQtVc3plvNGy/sBM1lLMMGJ6M44SK/BuzO1fKDbePMlwKJWfIfHuWbKqpBXqdeVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=m7bp2Vrf;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0831A606A33E
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 18:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0831A606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=m7bp2Vrf
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so416619366b.3
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 10:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371105; x=1795975905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VbRn6lUIefHO9idsi1h3mMXbFeQtqB3zWbpoKodoBns=;
        b=m7bp2Vrfqa0aHM9Yw8BJMpNb02/+acqC51Cs8Atw0TtC6Xg0n282++SueOTPMyFiqJ
         f5mr0KoO8f95LWQUZiJFcHz+h0DB12ejFSEkNMvbMwoQ2Vqe85WwSfgGaWAEYoLnrdln
         KP/stVxIx4kHMKhgiKDU3jRZXF+AiyOknd4mWaJjIz2S56hj4vvHvBLmvO2+i1YAiKqc
         BgH4Xl1wpR3V2N9vBvr/ZtxIZ3JYIc8SdE1N5XQuvi0APZNk1Ch2g2M2cliZswfIvkqn
         8TZhLYvDF1JH8BUP0ZGCzPS1KBa41gZ5WS+rJcyx8KieRMG8rZf07tEA97dndJAq2cTV
         AZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371105; x=1795975905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VbRn6lUIefHO9idsi1h3mMXbFeQtqB3zWbpoKodoBns=;
        b=TTMxHNxDgwskruQnFuDmqkBPxbS8/mongc3rlpUkMxZ/APBtvQubGgyENCrKSn/VS+
         S3h79gzriwknenx1NR3hIgZIawtngkkn0PSckgO2sv/jp9upKsUR3wwCZI/woX/n6KN3
         F5YLnVon4xG35ozNKTnzXXNmf1DKajxgxKjuMiFYxcqGGd+ESp1PMwJ+6zqMCnHLXlpT
         nYNOUKxrHzQK+vNF/6uPDMs5w7a7xjqKSpFaK07yvd45r8cGeFMFdJwajUi/M8TPtQwb
         tv08vH2vMN6KUSoPFVvR/p/doNqRg2SAWWutiBQMmiKPM8bGWj6YnUhmmsdN8RJVGqFH
         rLgQ==
X-Gm-Message-State: APuU4Z+de6DMolioO1vR+tDXjNiRKQTYABZsMplGAW/BqeC8ZR3d5xZ2
	0UkZgFD2j2j8nhC1Vg5X+klf/mIOMiNuihVXYHUi/rIeaRbxIGE7NfW0AgyuSMf9TA==
X-Gm-Gg: AZFdTZdp7isDrkiqMNVgtxpRhYqkPtPNzdXUGoJ4uhzxrBDu8jOPK0CkAtfdJLZMqLp
	fkZfimYslkQnxjz+FhY95ciPHBd+wVk9YLeuyZow+er6qBTzblkUeWf2MQjoKq/HZJXUklPVrpt
	xUHg8SyqUQ34seOWIIThFTMp22LvYUWfuhOQycNvqt05YOuX2vy6iH50ICWmW8IrPS3bCdRnjtf
	By5yl4Va7yDHvCd+8l/eeDZe0OEoIxpSAZSXE1v2a1VB2lbc6Ox6Tv/trWRQO+P4YBxbhGfRydW
	UxZ/mw36v5cKHqd3mRqW71/b2J4SQaWAsZubrcXYoSTONXnP+ye24Eaa0xHZtIUoABMm6i31VC3
	XwN5Z8S+n9vGY6tj6We0eyB9Me64AWAEmq46Z8KNkDzTa4GSUrEu78LmSidfNvGkYE83maVUCj9
	WiYHzBTvchexOyUs0Jc6ahsNGzpuQB4ZxG2RFNVr9NkhXhpBY5cZRYwzY3LROW00NNZtNNCAZDy
	0JsnsaCnz0XxWGfUnXmeflXlFeHezXHANvD6SQ2vAKgRVLr9w08WumeoGMEbBssiktu+oO8rPFw
	nKmy9G0Ny+tHTzYjufZTNMLHQls3KZaTV8jy/zrBoDPTxmfITNYiRlWSLOrsBk1mzfGapOS3Ftp
	bJMfMLOnoM5XI77ybtYcRDrzZb2LLb5ZVZ5WTucQVpO0vzNr+2NrIm36TMlB3BlSTt6GrLITKrZ
	CG7X9F1RuCBr4347gVEIbWrddC+2c/T7iCWk5VCK4JcbB/AnrxKkA+XKCxRhPfsci1GotRcFz9q
	NoVBybC4tQZuPcedsNdZhz7/5ErX6y1ZSJCFgy3DjETa+H9iqlhdaw6BOUg/twOIQ8hfQ8aCwlb
	Twdtpyfr4BDQIirTWzFOCtCFG4KJHhibqW9w85yzxVqN0dv/ZcLvq53m7a+XCdVkg19z+uXk
X-Received: by 2002:a17:906:f9cb:b0:c50:576f:b3a8 with SMTP id a640c23a62f3a-c513aaff1e8mr650474766b.48.1795371105507;
        Sun, 22 Nov 2026 10:11:45 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:45 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com,
	jtornosm@redhat.com,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	sriram.ramachandran@oss.qualcomm.com,
	yaojiale02@163.com,
	quic_pradeepc@quicinc.com,
	kvalo@kernel.org,
	sven@narfation.org,
	john@phrozen.org,
	toke@toke.dk,
	Christopher Griffin <christophergriffin05@gmail.com>,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH ath-next v6 2/9] wifi: ath11k: enable airtime queue limits
Date: Sun, 22 Nov 2026 19:11:38 +0100
Message-ID: <20261122181145.1015729-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181145.1015729-1-julius@bairaktaris.de>
References: <20261122181145.1015729-1-julius@bairaktaris.de>
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

Without NL80211_EXT_FEATURE_AQL, mac80211 applies no airtime queue limit,
and a saturated download moves every queued frame into the hardware TX
rings. Set the bit. mac80211 estimates each frame's airtime from the
rate ath11k reports through ieee80211_tx_status_ext(), and charges its
4 us floor while that rate is unset. Only the PPDU stats set it, so
single pdev chips, which take the rate from the tx completion instead,
would stay at the floor; set it there as well.

With the series and the AP pinned to VHT MCS 0, a TCP download to one
1x1 VHT80 station keeps 22 Mbit/s while the sender's mean RTT falls from
526-587 ms to 42-44 ms (three interleaved runs per arm, default limits).

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 6 ++++++
 drivers/net/wireless/ath/ath11k/mac.c   | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 0e3b4e836001f..081e79d3759c5 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -578,6 +578,12 @@ void ath11k_dp_tx_update_txcompl(struct ath11k *ar, struct hal_tx_status *ts)
 			ath11k_mac_he_ru_tones_to_nl80211_he_ru_alloc(ru_tones);
 	}
 
+	/* Single pdev chips have no other source for the rate reported to
+	 * mac80211, which estimates airtime from it.
+	 */
+	if (ab->hw_params.single_pdev_only)
+		arsta->last_txrate = arsta->txrate;
+
 	if (ath11k_debugfs_is_extd_tx_stats_enabled(ar))
 		ath11k_debugfs_sta_add_tx_stats(arsta, peer_stats, rate_idx);
 
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 90a0404a101a1..6f4462b7d3f15 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10652,6 +10652,7 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	ar->hw->sta_data_size = sizeof(struct ath11k_sta);
 
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
+	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_AQL);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
 	if (test_bit(WMI_TLV_SERVICE_BSS_COLOR_OFFLOAD,
 		     ar->ab->wmi_ab.svc_map)) {
-- 
2.53.0

