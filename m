Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886540;
	b=UEfrnXkX1bvJr9Ar7F1x2UHFw0C1sE3gshQs/k52XFcm3L50aQ69ZuaMhDL+3eIc2sGl
	 WZUAQmbXBOKpw4LX0Mt5v/vTSfMHSkv5wr3hz9c7SrTIXfznDu71x3ItmheEclQx1ocBK
	 M417PnKj1cGvr89jUKlwrtwH+KAC0r1QOr1nECAEcsdx7GLQlaaFUEtAQ8XxMM0pw1Imu
	 5r5tkmGKr+3XvcfMKg3MDDinx8yWUUWWDJhtkPVQG8hLrvIbULu3OYxvroNDve2f15pTG
	 XDJfbfVAPCWSv0P6ojhrc6wRVH1VjPQLM411YNastIjYGtGqZ7+6W7QMaE+rDLQW3Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=sYnLslG0vGfNapeKl06yr4lRqve9qB4fEnPycqLuwWM=;
	b=vYRzao5+erQpJ1O6P7is5mJ7xMUkR79bk8gmg9aOkml6rPJ+PcZVVQzpTldgQiq43OPL
	 0tMUUUoPGUJnrwh8vVgi08Dgt1YT+kW60Xq6MkIIE6puuDWYdOz95W2aYNqW0lN98Ior/
	 TXhkFCc5M6oBx5qUh1nQo88KOylhr5kKXzNWig/CbReSsJUp2IPB5YdlvGhhZskiRW5KN
	 SEZf+YSCogajKVdbiOMu6/9qiiAMWjud2TbfX1k3+rOnsS16lAhYZPLB7o4dvEJaIokRH
	 AxjVh6Owhc+1nPkqYjvumqsaPIRGMdgw9D4vzoICqABRCXdbhiei5UcoUdAQDplvseA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=TdCK2pBn;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B2E606A321
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 17:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0B2E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=TdCK2pBn
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c511c0e2826so1039569566b.0
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 09:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886538; x=1796491338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sYnLslG0vGfNapeKl06yr4lRqve9qB4fEnPycqLuwWM=;
        b=TdCK2pBni02a0qbI+gKc/47MyeXmqcfHIrbwcpebpOfcO6Q4bYj1XBI/wht7Pt7yNj
         SEGnYan8L91erBI9ypXiLuR8EMtBHfJXxhmMBfSd9isXFslJcydqHSzApBMjxVFMtMxX
         uAHhYNWHSAw88KYGiMrpjbMZUXlz56PixFj/fJE0QCRwC0AXsVy3voRm9G5K2k5SzVio
         fuDp1BlJmO6Kxs0oMrJjjnepPYpTU7F8qpAWYF7jaZjxZOS4yX6iCV2BxiyEge5/WDA3
         psdEgWVjJ9tYVpaIA+e5hDaJqMFmT21ZkaIzYxlWqVYYcMnUGSEbU+xtu0f0Skflc7nC
         /b4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886538; x=1796491338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sYnLslG0vGfNapeKl06yr4lRqve9qB4fEnPycqLuwWM=;
        b=mkv1inJ54ycnVUxVJr8ThaYboXlfwabM7mhpGvjvveUCuHtKuwBc041+qa2ZTi2b4r
         E5VzmFGOmKbtL9c2dEkrCUxYBXzp4omiAMaOHvSPTbLtlzVLB5JDkZIinqWKaQ3tKX/I
         FYnsC4QPd+ZQtQ/LKbVeeGjRsofzrlKZfezC8JW6tLjdVgmErl2EZtVD63j6IsoeSgTd
         9xJuTXq5rS4EhwGSC+h34d6DApteyhFdnVSr7yTzafYxCSc+N4reTn7gdzoKh5y14nL6
         HLVRhUA0CBzCegx5Yh7XOWrGejlThqZqMCC8qBf9URbWUgbvYnY0Cd6rjrRUQnU+f8hk
         +soQ==
X-Gm-Message-State: APuU4Z+2XnHU2q0w0TfCGllXVk20PTr/AxyKgejsR0nWUvMme/RFyA0g
	lI+xz/1UOleW5tm9Hmyzg3CR9ueCCkptAX4GRF0R9lgXcDkcWayN+xox4U/fXJeXWQ==
X-Gm-Gg: AZFdTZffLqDCb+ZDRlI1f6HoVbVjZ8NxqlPbq7VctdaovOfaJ5Z4e/gaImFalOC7y1t
	hg0oa+1Z6As/jgdtECa2/DOuX3oQvkhSiDjQwLlgCXgV215OO1tf6+AK1sBk0O2ehP/RJn8rnoI
	yB+f659z3S2mX9PPUlXi9rJnNazr/pdx1GiMCDB1MGNJ/ZDPTI1VxNwtmnimjntJB6gjazmZmPV
	T/DFg70MYB+VXPO9a4sRUiK0aZD6U4PUv/H5GpPE+ZtOJknN1he2VsQX8vDOd/IYfgA3zORebYc
	Ja+7XrAcJ5jHaCS1w019eTLMlnks7pidzoC/brv8dBXv1t/fXH40R/nu8Oues5V9qp2Q9eawpTb
	UgOUZAPSgFhnR6DEJ2lvVGcB+cbp2fWayE1Pn2OoqxfSp8Oh5U9CcClTNJGJMd2QN6eL2zshMnN
	0VKMs1/J92/Mq7fkxYMBUQxv0PUgTWN/LlNfQxpWMStJyGBcmoatmmejD0F/Sv31sydfA66oWmz
	HtRJjUOYab3ZmbCMflCu0cEI/1tYxGmiW0CHievoxPzyb46u464y7D3kmjx7kSV5dSGiPJLVwR+
	wbWT/1RzEZuF6YMdA01h9v9wj4ecx84d2NPp9NCNlcwHayr/n7p8OgVVk1B66LBAXRkKpQ+f1SE
	qbqd7h9RjtABLdmqA6QXWUQ1rcxpt1LyQShHKGH3ppuxWpAcNicsTry080iB+qsXrR56vrXC4xa
	qIAoNxmOw3jcxbjV4BoChJfo65W0pT5jYTeWVbDqi7Eh2S8oeH37x4rQixFF2eyVqfBd/sZCeXS
	MayQPs1I2nKC8squTyHW+gOwOPshjAWmp2HF7uNUiIW+IMEnnQgYkF1W7DrQBV40LlRjRp+jnTT
	JFQ192zzD0Q+DA==
X-Received: by 2002:a17:907:6091:b0:c51:51f7:c9e3 with SMTP id a640c23a62f3a-c5151f7fd77mr1878504366b.34.1795886538067;
        Sat, 28 Nov 2026 09:22:18 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:17 -0800 (PST)
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
Subject: [PATCH ath-next v2 0/6] wifi: ath11k, ath12k: RX correctness fixes
Date: Sat, 28 Nov 2026 18:22:14 +0100
Message-ID: <20261128172220.922376-1-julius@bairaktaris.de>
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

Six RX fixes for ath11k and ath12k. "The hardware" below is an
IPQ8074 hw2.0 with firmware WLAN.HK.2.12-01460.

1/6, 2/6: checksum trusted for frames the hardware did not check
- Trigger: an associated peer sends ICMP or ICMPv6 with a wrong
  checksum, a UDP datagram with a wrong checksum in IP fragments, or a
  TCP or UDP packet with a wrong checksum in 802.11 fragments (a station
  sets its fragmentation threshold below the packet size).
- By the code, every ath11k and ath12k chip and frame mode.
- Shown on the hardware with OpenWrt's ath11k, 50 frames per case,
  1 run each: with ath-next's rule the AP answered 50 of 50 ICMP echo
  requests with a wrong checksum and 50 of 50 fragmented UDP datagrams
  with a wrong checksum; with this series it answered none of either
  and counted 50 checksum errors each.
- Impact: the stack accepts such frames unchecked (icmp_rcv(), UDP
  after reassembly). CVSS 3.1: 3.5,
  AV:A/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N.
- Workaround: none; mac80211 offers no switch for RX checksum offload.
- Found by an LLM review (Claude) of the code.

3/6: ath11k delivers frames under a forged source address
- Trigger: a station associated to an ath11k AP turns on 4-address
  mode on its own side and sends data frames with any source address.
- Reachable with frame_mode=2 (Ethernet decap) only. On the hardware,
  an ath10k station sent 200 broadcasts with a forged source: all 200
  reached the AP's bridge, which learned the forged address on the
  Wi-Fi port. One run.
- Impact: a station can send frames as another host, and the bridge
  then sends that host's traffic to the Wi-Fi port, where it is lost.
  CVSS 3.1: 4.6, AV:A/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:L.
- Workaround: the default frame_mode=1 (native Wi-Fi).
- Found by an LLM review (Claude) of the code, then reproduced as
  above.

4/6, 5/6: replay check of the group key skipped
- Trigger: a radio in range replays a recorded group-addressed data
  frame while the receiver gets unicast data; no key needed.
- Both drivers keep one receive status for all MSDUs of a REO reap and
  do not clear RX_FLAG_PN_VALIDATED between them, so a group-addressed
  MSDU behind a decrypted unicast one skips mac80211's replay check.
  Not reachable on the hardware: its firmware releases group-addressed
  MSDUs through the REO error path, which gives each MSDU its own
  status. An ath11k station under unicast load received 29011
  group-addressed MSDUs there, and none carried RX_FLAG_PN_VALIDATED
  in from an earlier MSDU. It would be reachable on a chip or firmware
  that delivers group-addressed MSDUs through the REO destination ring;
  none is known.
- Impact there: replayed group-addressed frames would be accepted.
  CVSS 3.1 if reachable: 3.1, AV:A/AC:H/PR:N/UI:N/S:U/C:N/I:L/A:N.
- Workaround: none needed on the hardware; elsewhere none.
- Found by an LLM review (Claude) of the code; measured as above.

6/6: ath12k loses EAPOL and group frames
- Trigger: an EAPOL frame, or a decrypted group-addressed frame,
  arrives in the same REO reap after a data frame of any station.
- Since commit c4aa897fe234 ("wifi: ath12k: Handle DP_RX_DECAP_TYPE_8023
  type in Rx path") ath12k sets RX_FLAG_8023 in the shared receive
  status and never clears it, so such a frame goes down mac80211's 802.3
  path with an 802.11 header and is lost. ath12k uses Ethernet decap
  without any setting when the firmware advertises
  WMI_TLV_SERVICE_ETH_OFFLOAD.
- Impact: 4-way handshakes and group rekeys stall until retried, and
  decrypted broadcasts such as ARP, ND and DHCP are lost. CVSS 3.1:
  2.6, AV:A/AC:H/PR:L/UI:N/S:U/C:N/I:N/A:L.
- Workaround: none.
- Found by an LLM review (Claude) of the code.

I used Claude (Anthropic) to help write these patches.

Changes in v2:
- 1/6: also leave a frame reassembled from 802.11 fragments and a raw
  A-MSDU to the stack (Sashiko, on v1 1/6).
- 2/6: also leave a frame reassembled from 802.11 fragments to the
  stack (the same finding); read the new flags from the last buffer of
  the MSDU, as ath-next now does for the other MSDU end fields since
  commit 1e678e37ff13 ("wifi: ath12k: fix decap of MSDUs spanning
  multiple RX buffers").
- 3/6: result with the check run on this version.
- Rebased onto ath-next; discovery lines reworded.
- v1: https://lore.kernel.org/r/20261122210525.2076058-1-julius@bairaktaris.de

Julius Bairaktaris (6):
  wifi: ath11k: only trust the RX checksum of a frame the hardware
    checked
  wifi: ath12k: only trust the RX checksum of a frame the hardware
    checked
  wifi: ath11k: drop decapped frames with a source other than the
    station
  wifi: ath11k: clear the crypto flags of the receive status for each
    MSDU
  wifi: ath12k: clear the crypto flags of the receive status for each
    MSDU
  wifi: ath12k: clear RX_FLAG_8023 of the receive status for each MSDU

 drivers/net/wireless/ath/ath11k/dp_rx.c       | 124 ++++++++++++++++--
 drivers/net/wireless/ath/ath11k/hw.c          |  22 ++++
 drivers/net/wireless/ath/ath11k/hw.h          |   1 +
 drivers/net/wireless/ath/ath12k/hal.h         |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  17 ++-
 .../wireless/ath/ath12k/wifi7/hal_qcc2072.c   |  11 ++
 .../wireless/ath/ath12k/wifi7/hal_qcn9274.c   |  12 ++
 .../wireless/ath/ath12k/wifi7/hal_wcn7850.c   |  12 ++
 8 files changed, 188 insertions(+), 12 deletions(-)


base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
-- 
2.53.0

