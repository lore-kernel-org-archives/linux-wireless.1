Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795881815;
	b=1Zu99Eql4G6EI3zqcS/KuwEGM3IY4TSXwPs74Y33Zd4fpVjFlHG/Dc22U+tBM3ZaXnsJ
	 lDi6LZyGqQnYt2OUL4wBoYJt16nb7/Y+NSr2H9r5K8nLTIIMkzvOscL+ICNKhkgCD3i2y
	 +8GsPbNx4O9yb4Opm5LtQnKzvvdeYVfjq6z4o3O11R21Jfy7fNfAXsrGufNkBG5J/U6Dn
	 Z9C2ad/VSoi/oK30M6QwxjR7a4em0uEtda7mhqV0Ee9yDm0gegmohDr10kmtH631DDwYU
	 XPWnw7odEQXbsFI00VhdIhweljrMT+g5vNgU4zHqwb51PzkZMvc6KhVYnuVpfNrnfiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=QG5bqvH6G2ts5z7jK3nFh/E6bD7F3feukNvD23/Zfk0=;
	b=eY9eyW4hC/qVv7RFMXDwHQGSTfKf50iuL064zp8egyKZVYIP8dpzWrXVbCLP48gJOYkH
	 DcY/BlKra7CaIrtz8yadtZrc4gp9SJW9fmYwfw9J7kpXMsJOjdKuwBs4i7IDkxZT+eOQ/
	 hYIOYf08etS6PxjgQUCqkR+b8Ufztq57iMcwNoFeLs+OvP1QlJPsbgVUd5VOX1bIY49Wq
	 2+2J3x/E3XBRFDczh4mdLgydw6Js0i57j6hzf335ddjN4HktdCoDfqLZNtXe8Z+b5RXhy
	 1gQHWAPPKObkP4+bQMXvpnDvyFDh241lCjo3h+AqaoWRcI8KJhxT9Hvov9Hr/gEzJtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="PTaX/ctj";
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8150D606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 16:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8150D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=PTaX/ctj
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c516a194350so430345766b.3
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 08:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881813; x=1796486613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QG5bqvH6G2ts5z7jK3nFh/E6bD7F3feukNvD23/Zfk0=;
        b=PTaX/ctjxe1IepneYaIpHiRsjJVucqpg0nnxO/omiTf/l3jIjvRRPT4UAJanLXGXvu
         3VS4LMudDcJy1polGsvvQ23NyXtUZy3UPcYQd3gLOLBtcBQ24oG5w5XnSs+US5Ffl6vn
         IdKT0cPTlvFqrqw7rjJoVsaOw/u0owaZJgpZXTQmdEkntgEbnA9g/1QUcb6f5LL0GPAk
         YWRcm8611JyLJzTI7UohqpkkNbyXElAbAE0OduSxX0g1bx6/ulcEkzXF2OMYwgBDxt6D
         Yg9nScbTkZpnJHYCdbl2oVekH3UK37bevHNCzQfhhjUcG46nEURBck7n8aZPzlNajdoN
         AcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881813; x=1796486613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QG5bqvH6G2ts5z7jK3nFh/E6bD7F3feukNvD23/Zfk0=;
        b=wp7Mm0QCYYlGGSAYFXB+n6oqiHW0X0ewxDThMAPyz9bKYN3Nlufva+fjHrQmwtRCRg
         w7/CnlcMZ34VNurmR2C/8N7E1KFZCXLyczO+RzbJtTfiARnwEo5t52FikUW4LULeteGU
         steSJjm8s+xff2drm9R6G6zuRFcMfVDztDikjeLXufAvjf/S9vgb5+In+Y9H2kU57nfY
         COydS5sR1nmy7+Ja+UCPqktMZfYJn2qb36AVYF6zuPRq0ZygBtBcXkVHn16MU05NObA7
         quTMvU38fEx5rvrJ5N+vE9HMc/A4CcdisHLfmIFa4a86YKO3Z8h72Km3UEa3K80hW8NW
         WSsg==
X-Gm-Message-State: APuU4Z/ZoFl0Mmzg5W/YzdTOsm9hoMuNr4URAdNxPo7g8rqTH6Bxdn9H
	3hv2MYauZ0XPV0dZptZ9W4z5OJhI84rxnpWGmHMiLPLb03+vPthTDUzENP3A3Ud4IQ==
X-Gm-Gg: AZFdTZfJIvInYcusC85TcjBTS/56D++gvmXOX8Y7SwPjvBqiJzSfdsvFw+BAfDiiS4Z
	RIr384/HfY0PVhRth+Z4yHklH1YNg1cAy3/SOKGN+YKfzwF3iCsUY1uXgYGkvzBniqwQE1iTvMF
	KtIAVs0xLsICuLlxttkou+gfI8fbpe+YFIa0Nu1hqXawNUZAyg+FkFNPctoLpGz6Xn5psw2xJWf
	oZZznAKmcN+IdEy2oEm5VlQS6n9AvpH61rjb8dgYG+Ajreivnw4pb6lUJWUwgOJOANQcWr93B3+
	ygMf9Pdhhj/ax7vUI2Gv1HtoTpyftFjIWBFvLjjS0idKuOPbaG4IsHUV361Rtq6Y5efmkNU8wAY
	iBuOsrsT1W6DFUmVRw660aDB/ZaQV+oV0lG8c/sObdr/ktOF6zFRJ9XpAUNF2EQumsnQaUflYOi
	G1GKXaMZD1PSdWSHgPJWteynXqytJ2oE6i5VfaGHOKK+JDyQ4G+melhSpKqZsQhOrLimhQGmJjk
	epgmNLSW9A2gePCf1KzhClcIcr0Y3TvK/BPhlhwQX9h3Df8KfQPFvNaai8enkEkYrpy4GgCfMDU
	zvh8rwr7CCDHGBjMDCs7ckANBrhHtfPfoaVnVITiRg9lOCeAMVQqTeMqB//P9uD0VGMhyTBDDnD
	0oT4RYMXnnJzD+3rDCjeaHct+iOtkjc3fXDOcRwZWd7/Nt/asFvb+Mkezo5ulEhhv33U6Lu8GtI
	tEgutEIEBYWSyImSHRrP5SEoaxJWC2O/1TePIQRl5AsEgK1MoE4TvzYju9ydxwICXGRK+rQ7ZDk
	+r52O4LczQfGENJD6gY/Jm4XqqKthYDo2exwzChiPv0x1qLpAMk5dsAOh74XmPm6qQbnbR6dVb5
	V3OJsp3PKp2/3A==
X-Received: by 2002:a17:907:2d0e:b0:c51:e820:661b with SMTP id a640c23a62f3a-c51e8209357mr203301766b.27.1795881812763;
        Sat, 28 Nov 2026 08:03:32 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:03:32 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 0/7] wifi: mac80211: TSO and SG for encap offload, and the TID of 802.3 RX frames
Date: Sat, 28 Nov 2026 17:03:28 +0100
Message-ID: <20261128160335.1815537-1-julius@bairaktaris.de>
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

Patch 4 lets a driver offer TSO and scatter-gather on the netdevs that
send with 802.3 encap offload, without offering them on the 802.11
path. ath11k uses it in a series for ath-next that lets the TCL segment
TCP batches, which depends on this patch. Patches 1 to 3 fix the AQL
airtime estimate, which patch 4 uses to segment a GSO frame for a slow
station.

Patches 5 to 7 count frames received in 802.3 format on their TID: the
802.3 receive path counted all of them on TID 0. Patch 5 adds the field,
6 and 7 fill it in ath11k and ath12k.

What the fixes for released code change:

- Patch 1: a station that sends at a low rate to an mt76x0, mt76x2 or
  mt7603 radio, which compute RX airtime over a whole A-MPDU, is
  charged a fraction of its airtime and gets more than its share under
  airtime fairness. CVSS 3.1 3.5 (AV:A/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L).
  Found by the hosted Sashiko review of v1.
- Patch 2: every VO frame an AQL driver (mt76, ath10k) sends at an HT
  or later rate is charged less than its airtime, so the VO queue holds
  more than the AQL limit. CVSS 3.1 0.0, queue accounting only. Found
  by an LLM review (Claude).
- Patch 3: an estimate of 65536 us or more is charged modulo 65536 us.
  Without patch 4 that takes an A-MSDU of about 8 KB to a station whose
  last rate is 1 Mbit/s. CVSS 3.1 0.0, queue accounting only. Found by
  an LLM review (Claude).
- Patch 5: the per-TID RX MSDU counters of a station count every 802.3
  frame on TID 0. CVSS 3.1 0.0, statistics only. Found reading the
  802.3 receive path.

None of them touches memory safety, and nothing short of the patches
avoids them.

Tests, on x86_64:
- A KUnit test of airtime.c (not part of this series), HT MCS0 20 MHz.
  wireless-next fails all 5 cases: 65536 bytes come out as 2834 us
  instead of 80658 us, the VO and A-MPDU estimates of 1500 bytes are
  both 1912 us, and 65540 us is stored as 4 us. With patch 1, 3 cases
  pass; with patch 2, 4 (VO 1932 us); with patch 3, all 5. One run
  each.
- mac80211_hwsim in QEMU with a local change that sets encap offload
  and encap_netdev_features (not part of this series): a netdev created
  as station, changed to mesh point and joined to a mesh, TCP for 5 s.
  v1 handed GSO frames to its ndo_start_xmit and skb_checksum_help()
  warned, in 2 of 2 runs; this version hands it none and nothing warns,
  in 2 of 2 runs. A P2P client netdev has TSO and SG with this version
  and had neither with v1.
- W=1 builds of each patch for x86_64 (gcc) and arm64 (clang 21), with
  no warnings.

Changes in v2:
- New patches 1 to 3.
- Patch 4 (v1 1/4): the encap features are taken away per frame on the
  non-encap netdev ops, the AQL fallback keeps SG, a station without a
  usable rate gets its GSO frames segmented, kernel-doc for an
  encap_gso_max_segs of 0.
- Patches 6 and 7 (v1 3/4 and 4/4): read the TID before the copy of the
  rx status overwrites it, and report frames without QoS control as
  such.
- Rebased onto wireless-next 18d0bedbb5f0.
Details below the --- of each patch.

v1: https://lore.kernel.org/all/20261122134228.956044-1-julius@bairaktaris.de/

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (7):
  wifi: mac80211: compute the airtime estimate in 64 bits
  wifi: mac80211: use the ampdu argument of
    ieee80211_calc_expected_tx_airtime()
  wifi: mac80211: clamp the AQL airtime estimate before narrowing it
  wifi: mac80211: advertise TSO and SG for encap offloaded frames
  wifi: mac80211: take the TID of an 802.3 frame from the driver
  wifi: ath11k: pass the TID of a received 802.3 frame to mac80211
  wifi: ath12k: pass the TID of a received 802.3 frame to mac80211

 drivers/net/wireless/ath/ath11k/dp_rx.c       | 14 +++-
 drivers/net/wireless/ath/ath11k/hw.c          | 25 +++++++
 drivers/net/wireless/ath/ath11k/hw.h          |  1 +
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  2 +
 drivers/net/wireless/ath/ath12k/hal.h         |  1 +
 .../wireless/ath/ath12k/wifi7/hal_qcc2072.c   |  8 +++
 .../wireless/ath/ath12k/wifi7/hal_qcn9274.c   |  9 +++
 .../wireless/ath/ath12k/wifi7/hal_wcn7850.c   |  9 +++
 include/net/mac80211.h                        | 23 ++++++-
 net/mac80211/airtime.c                        |  9 +--
 net/mac80211/iface.c                          | 28 ++++++++
 net/mac80211/main.c                           |  3 +-
 net/mac80211/rx.c                             |  3 +
 net/mac80211/tx.c                             | 65 ++++++++++++++++++-
 14 files changed, 188 insertions(+), 12 deletions(-)


base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
-- 
2.53.0

