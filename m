Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371106;
	b=ZL54a7hYH1KyCvZI82UfiA/SonN5oARgy4DGHuY0k1AchkujwMmvWvnn/nTMk/9IhE/L
	 qzkY2dBSFEyhRh9Tsa5aTYkcJJRNIbuaO/f3b/OULVrzwFovq1vYZOidYikLBzMsRXY7V
	 bYFxzU8RTa7J/ZL3cLC+x8O2nVUuKY4jX71VipesPr4vDFyb3DHyVPTGuXCm1lSLSADzI
	 iKzajXBznkxJgPgo30jLEgSx+mwKytq4WfFH04/Jl6DHzOKGqmGqzYtTm1HGzoiCo6MHC
	 gtcifK2Tv+z4LwVVd8fkvLpoFl821gRlSa9qhaDfhuOJ6T0gcvJWhEBo8FUr19c2Kvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=S6XF6A4HETfjGyZFbXlO8ZHE9ly/RMXooaBmSQIOc3Q=;
	b=f7P0nS83JmEdH3NppzZdjnb/nZb0pwXkdUfYGY/ptg2vU5I4xPqN1KLFaZRfnocaKWW0
	 PghtxNEQtB9J61ZFbKbn3G/rtjzQQo88HcZvKqQMO735rHYC2rocWNYUzrGUPulTVM+zM
	 GB1SNc6ZwBU70MeAa+GmGPQFOrjxt3uWriRJeI4C89g+QJbFvRsysp6N+7yENmQpnVADt
	 OwAOq1NwgZjqvo4OyGUtudA2lyXb4xQlLsqaj3rjQMADCGpgH3hVEqZJwBs3xgGcGokIx
	 7JbDypg58xVBLwwnUnR6yX2vyLYZw78KqCjpTJH9K2in+rONSxffx69TFZU4FCE7iVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Q2sPgKTl;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF657606A32A
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 18:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF657606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Q2sPgKTl
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso433804266b.2
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 10:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371104; x=1795975904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6XF6A4HETfjGyZFbXlO8ZHE9ly/RMXooaBmSQIOc3Q=;
        b=Q2sPgKTlmhUHlNxZ6KhLtbKzycwFAJHgGYmqIxqCmKPf4MXRJSRuXmVMZReadQU33d
         5H0ZoLnJfbeeyNvzfebu1WkBS/uvE9Jbw8fr23mCJOJY8u4djUGCOuld7ip54rVmGa0S
         V/cUBVRqf02wAHOE5QzfRFN+QTgVJiU9Z5QIjG1UwNd1MAAIPGNimhG5NXWmGnYqDUax
         J7r7FVdXTeScDtyPH/zI6wchULVcTXW2TllKwtwZTuG2+lztdncpUwHounUaliK4YG6g
         1hFjsIvmqNpfscziriwdJYO+YTxF7dN/YGEsMpboeJrxi45R5A8rOpa1RAY2rLNTUTWF
         2HeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371104; x=1795975904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6XF6A4HETfjGyZFbXlO8ZHE9ly/RMXooaBmSQIOc3Q=;
        b=KR7b3MPsm+BakRXacRfZvp63KQuChYBoK9TAiQGrt+9r2G90Y5/cWaIfn8ESmn2vzK
         dYSwS1jVmcPcYDSGpphiy9y9/LA9oh2GG71wAzJ1UJCtsx967fQQ2x9dZ9e2OZ/O5rxD
         xza+PCnT/lsGDQiuCIvHg7dHzW6qp41hmrdJGSwFz/hmyYle07nWlKo80v1IdNUm8KAu
         juocK012HSXXMzxezq3AZNWGpylKHiQrfn/iF+oQF+vXyCxor6jBneEH9ajUztJZRwju
         vp/V443jNFLgxqnz14pWLyp66IXX1QZKhNnKz7qQ/vY8DJEz2eqULABqxNs7PKRkYAkO
         4AvQ==
X-Gm-Message-State: APuU4Z8mt7HZDMweh93Pgpk8auzSL6aU2zsiccIzs8OZw9YeFtYWsDpx
	h49oYWyn0pOOW/EMtiGITcfd99q2sfiFcmBHv6uGalzM3MVlNmjTYh1BRR4l5pYwLo5RvmcVSWv
	4EVUcUw==
X-Gm-Gg: AZFdTZetAxJ/yWx/zgW0gqK1tlrSGM/TYBrNkkbILPb1Mdrfm/kAW8AiTo8pErXkEej
	ekmNN49jI8/1idwypGxktDdGoEXA8C6kM1AgQ5dlAK0fuqTH7/QyTe9lik5QhKseOt5IK0Xq+6i
	w0pf4Mua7X2kNxA3nKjlCz5X7ZiEdW+VSvqgF7Ud2UsL8y4YmKg83wLgGb5XcjJgel4Zc2VjkzM
	Xw86PQS/kzrUp8pHpXnbaOKuta2/CK1wxP/YSReATdmsp9TA4dAtF/iDIPoZjYPXGSasQODVosK
	cuQUM4zchZUIRHgVoYdJ187mTg6YFptEZS/+1Yi9KIgsVyM7D6xDONkMoL7gBiP02ZOzxnYWCM9
	gz0FvXvZVmIcQTOwWh5gNz2kkdodBFr9BFzwTZA8nTi9hV6NqMJejsUOPUjg28RsCTzG5emQw2j
	ZsqHewi0U6WY5NEz+HcYriObTnJLRnGhI+kGs3CIbXEN3X4Ut3P0c2tdjSsDrpSOTHHfG/7BVL+
	QBo7LZvlVaozrvbIzbglDHpV94H6Qr6ZAHxhpyS5aJHv50Qe99b90ez5P5+JCylmne8DeGshh8/
	XMYlwI9+2VZm0LK7/3/abdDKkI6sp3pY8riM5hiUkwRxc4o22mvtpVXddwNXf5q/Sv641Uu5+Tl
	mVfznlckp1rOiC3+UiBXrI+VuzmDBIUjdESWI0PrHHNPwFRm+AeOjOGkQ64YfdomNbUMSJZTx2h
	plt3WGKr+xNXI9K2UgSLdNAr+nU8YIK37AzXiB4wDC6tdQIDuGYL+49UYwzQuslDKbN5t4ogxcu
	4gY4ddFO2GMivMASGaMMbGFNMjmSFg+Boyg7vL0Y/ALWvtBf5gJk7B1bKbzzkkhEnEYWsPeAeVv
	it5zpzxMC/TIueKT0sMukbkf8o1AcJF+DYdkyAr7naeGSeCnFdso/m3AFFRJzTs5LcF5A6HaKuV
	2SfUzBtiktf/jLN/NEsk=
X-Received: by 2002:a17:907:c13:b0:c49:df95:fd0 with SMTP id a640c23a62f3a-c513aae2c7dmr781438066b.48.1795371103982;
        Sun, 22 Nov 2026 10:11:43 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:43 -0800 (PST)
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
Subject: [PATCH ath-next v6 0/9] wifi: ath11k: airtime queue limits, airtime fairness and a driver TXQ scheduler
Date: Sun, 22 Nov 2026 19:11:36 +0100
Message-ID: <20261122181145.1015729-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

From: t <t@t>

ath11k sets neither NL80211_EXT_FEATURE_AQL nor
NL80211_EXT_FEATURE_AIRTIME_FAIRNESS, so a saturated download queues
every frame in the hardware TX rings, where there is no AQM. This series
sets both, registers tx and rx airtime, and runs the TXQ scheduler from
the driver and from tx completion.

IPQ8074 AP, TCP download from a wired host to one 1x1 VHT80 station,
default limits, 20 s, three interleaved runs per arm, measured on v5:

                        Mbit/s              sender RTT mean ms
  auto rate  without    92.9, 94.4, 94.3    111, 232, 231
             with       93.7, 88.0, 93.6    124,  51, 167
  VHT MCS 0  without    21.4, 22.3, 22.6    587, 550, 526
             with       22.9, 22.2, 22.3     44,  42,  43

The v6 changes to 4/9 (the share of a multi-user PPDU) and 8/9 (ending
a round on a full MSDU idr) do not act with one single-user station
below the idr limit, so the table stands for v6. On v6, a routed TCP
download to one HE160 station at 883 to 923 Mbit/s logged no "failed to
transmit frame", six runs with aql_enable set to 0 in debugfs and six
with it set to 1 (IPQ8074 hw2.0, WLAN.HK.2.9.0.1-02146).

On v5, airtime weights are accepted but leave a 2x2 HE160 station at 45
to 49% of the airtime against a 1x1 VHT80 station at 1:1, 4:1 and 1:4,
because the firmware serves every station with frames queued in turn.
Ending the round at 256 MSDUs in flight, as Toke suggested, gives the
HE160 station 65 to 80% at 4:1, but at 1:1 its aggregates shrink from
258 to 100 MSDUs (one run) and the two-station throughput drops by a
third, so the series leaves it out.

An 802.3 frame freed through ieee80211_free_txskb() keeps its station's
pending airtime, because mac80211 looks the station up from an 802.11
header; that is fixed in mac80211 by a separate patch [2].

The series is based on "wifi: ath11k/ath12k: implement TX flow control"
v8 [1], patches 1-3, and applies after them.

I used Claude (Anthropic) to help write these patches.

Changes in v6:
 - patch 1: return the frames in flight to mac80211 on firmware recovery
 - patch 2: report the tx completion rate on single pdev chips, which
   stayed at the 4 us airtime floor
 - patch 4: charge each user of a downlink OFDMA or MU-MIMO PPDU its
   share of the PPDU duration, the duration divided by num_users, not
   the whole duration; reported by Christopher Griffin
 - patch 7: register rx airtime under ab->base_lock; mac80211 frees the
   station without a grace period after the peer drops it
 - patch 8: end a round also when the ring's MSDU idr is full, so no
   frame is dequeued only to be dropped; reported by Christopher Griffin
 - patch 8: end a round only while a frame is pending, and mark the
   access category before reading the pending counts, so a completion
   cannot miss the mark
 - patch 8: drop the management queue from the commit message; ath11k
   has no management TXQ
 - rebased onto ath-next 1983b40acfcb
 - v5: https://lore.kernel.org/all/20261018174904.1757161-1-julius@bairaktaris.de/

[1] https://lore.kernel.org/all/20261021060725.242681-1-jtornosm@redhat.com/
[2] https://lore.kernel.org/all/20261122150541.3117507-1-julius@bairaktaris.de/

Julius Bairaktaris (9):
  wifi: ath11k: free tx skbs through ieee80211_free_txskb()
  wifi: ath11k: enable airtime queue limits
  wifi: ath11k: report the pending tx MSDU count in soc_dp_stats
  wifi: ath11k: report tx airtime and enable airtime fairness
  wifi: ath11k: schedule TXQs from the driver
  wifi: ath11k: run the TXQ scheduler on tx completion
  wifi: ath11k: charge received airtime to the station deficit
  wifi: ath11k: stop a scheduling round when the hardware is full
  wifi: ath11k: budget the tx completion handler

 drivers/net/wireless/ath/ath11k/core.c    |   1 +
 drivers/net/wireless/ath/ath11k/core.h    |   7 ++
 drivers/net/wireless/ath/ath11k/debugfs.c |  10 ++
 drivers/net/wireless/ath/ath11k/dp.c      |  11 +-
 drivers/net/wireless/ath/ath11k/dp.h      |   6 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c   |  34 +++++-
 drivers/net/wireless/ath/ath11k/dp_tx.c   | 140 +++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/dp_tx.h   |   5 +-
 drivers/net/wireless/ath/ath11k/mac.c     | 105 ++++++++++++++--
 drivers/net/wireless/ath/ath11k/mac.h     |   1 +
 10 files changed, 289 insertions(+), 31 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
prerequisite-patch-id: ff44eb6f1d673e75bc013e3ffc870d7d30252c17
prerequisite-patch-id: 2cde5e2a788f79e4b8c858a60ec11cd120b1b97e
prerequisite-patch-id: c86d3c9047c851f45b5d46398850c9d810d82258
-- 
2.53.0

