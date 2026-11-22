Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795381526;
	b=UMRN94VkdXc0UD+9gbwQbgfdsJOwKyp4jhanrbCIbLSIsUpCY+WxH+NT0LUVLTdVLSEa
	 UE2M6FXGdxItMjQ6m8mEN9OhjmLQi0b1UtSg3cRK7v5UbqfB0WzSuGdCt/6H+y4hZEoR4
	 v1DsrazRBVsopo8UpJYUAT3Qo/4in9rXvdMOrFjmmlSVrYYCYovsZ9vZr3EGKHRn09m6q
	 8Zz+nuoO63H7AjCP0cL1/1JVxr0ggLS3MguVdBNsPJLbUSO+jIF3o97viHzCvhk35L8YS
	 D/KIrtjWkqahb9g/fMYlv9h/T0OBnyomLAUoqPxmbHMe2yZdsiD9omwdns0TgB2s7nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795381526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=27y/kU2vWPdOKL0QkXcnrWUvBUFwGMg7n99J2f+jkbU=;
	b=WjVC3eWIPyWZE23ZkEhJvgD4GGe9MmIL1EcrwX2b6gAxlvyuJYZpdn+em3ELVL3TgqgD
	 kWZJzV85i4gp1mVMlw7tL37JNmmYoPFUpASYwTH7pFeas7sC7K8o+z1uxbkoRFvc7EXfK
	 c/tjtg+Is3NkAzklFGakb8mmoZfaCFI4+sJPdnoqmi5XxCrHEZ1hya32RHwunBPRsWoay
	 IR5GuT7rwR1om/hc4uwqZPalECFJdmazsH92cdsWOQNz1fiBZwDceLeMx3mpXlBb0VMgv
	 d/eMB+gB++LNSquT4MpSQEEmYlTXHZVrjaXrbvuKEMNCoSflEBfEf7K9g4jRPYzQ23Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=JFIYD4vG;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A871606A31A
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 21:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A871606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=JFIYD4vG
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50e26763a4so486378466b.1
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 13:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381524; x=1795986324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=27y/kU2vWPdOKL0QkXcnrWUvBUFwGMg7n99J2f+jkbU=;
        b=JFIYD4vGA3UM+nNxBwjA040l8fKTreURyg00XjijLsJgPNIxc+5eULNG9oxUqYmipg
         UK7AiBZLFEQnXf4OhtBKd2WOICvURJDQ+iRhLSCLqqdwby+6JM9Ia6sfgREpj4BhOweX
         Lu0pUKE+yxnDyr3zpUYfJsJK+t7wWlcFy9ARQtJx5Bsyx0OfJDCFt8dy47db5BNxvjCX
         pCMINEGHXtKJx9DjmcJUt5ULtOYuOrhzKOc0h51Njjshr+TTxpuhREIaQnUhzt2HPPEM
         OQS/XCDcmiNiqHw7m5swCimDbPwKAJmtaJDrrU/100tmaDgSjwHY+ouvgyF6D3V2DVYs
         fjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381524; x=1795986324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27y/kU2vWPdOKL0QkXcnrWUvBUFwGMg7n99J2f+jkbU=;
        b=VvAvhr0xfxBstxlwJUbSv/9wBGvz0gmojFrIMkbAhnhq9wwAP3bqKg+YlNm6zob1lU
         yKBmWO9t10X8/HMo6sdDFD9IWT4rC3wl4NHquNFasRY5oo0sRvc4nBS+FpzRWGxX/LOn
         FVNobR+smkQKzRnm3qab7n7ogMah5hhprlqZMqJVWkftlCz6KgNw0DgnwistGS7fi4Jt
         9lOd2KRjN62NEO1dPnmcvS50bbLqfGrukqUADxDTqPwa1Tk02xSOuvUQrPBK3Y+Xiu9P
         B69CFG6xU+LPAj0SFIyqAZNYm4xGuvH7vI6FAdCawbE61uCcVLVTY9bAbTWyo5mVoKfR
         v8TA==
X-Gm-Message-State: APuU4Z/m8vBbTZHxY0765gDuj8rjatNAPsCPhfrvL/Nn+T1dXXnG3lAd
	q0y5qLbULTSdYPKnCcNlisNQ84JzBFcneMAEi9LmQADHpC2tjY9+4KMgFdCAJ8PJxA==
X-Gm-Gg: AZFdTZfKONKXzeNADVPwizMIw+idTnypEO3ZxKU7/cwMhQHDd8GtM6wxCmfMHSHCATH
	dTWau2PJY38+suL0lAWPpnB75AHYRV8FwLWrZDP9hX2ed5Fjj82cHCV5vH3DQ0EKtwTBPwImra/
	orzrLQvPq5cJzDUWVjiF7hW5slMA/K2AxzgZHOObyN874gZ0Bg/QnjCjW3hxuo/e46cszbz3aEW
	jNksAccGhRZYTOffqgeQd/CkUTp/u2P3gTm5mi95+O2gCTUVhvQt8qZK1FyLKfXgmegfQJGeiPB
	IVlY4CqyrPP4tPXACMdVBAZGLFreCQXntXbvj/mOwBeuj99s3v5njRIUs3tPCT2xQGj0fRCq046
	yjy63P1/50RWKDzvXJXWbFBJFu8C2cQJllAxvH6jkAnCan6Zu2/Q6bmZfhDVifcZ+qzeLdn66C+
	QWSuPtUEJBzLDrtNv3VDzoy4w+/d7+0bLrkWVWU4eqA70yy+3Eq4EuE9HpCEj0yTlvELmgcr8Pu
	+vyC0ufIUYGtRI+EO854TqTQiNLHG0xyeY/sO0w/2yD5DH4e6xpyElimN0wIfPLZMU60Huxmwuy
	PXzpIjdV0QUYV/C4bOlp2GihfqPOYLgs+V56VBYMSg+u8hFH8b4D6nQvH4wSAnyd6uGszwHhV9m
	yYo1aLQnNULhnjWTPy3ffzXuaQnYhQhMmddF3hFP2nqi5heVCn/x3P9GyUfQfnoBnW7/dNv9HF5
	vUWIcJ9W0Sv6TftVMkxxFUq97oLaE1+34mswlpg2X+wFnG2Uqbhllx7Nzpk9ZGA53W5Z7dPqzKz
	Ol7T3wVrRC1Kh0cONq+LCKt7eTwDQN8aKjhIx5yRoTb9LFOo+IrdrX5XCV7ztKkN/hvEZnv9plI
	G5omkl9kna5b3gyoS7riv+wOBF0a8E7qukS3Z+AXHnBwdvajmeYq1XMtxi86p0cnQ4JffkjSBQQ
	=
X-Received: by 2002:a17:906:b1d5:b0:c34:c5e8:1dc5 with SMTP id a640c23a62f3a-c513aac1dfdmr589785566b.20.1795381524002;
        Sun, 22 Nov 2026 13:05:24 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d300ad8e04c1718a6e78.dip0.t-ipconnect.de. [2003:f2:4713:d300:ad8e:4c1:718a:6e78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm339935766b.57.2026.11.22.13.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:05:23 -0800 (PST)
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
Subject: [PATCH ath-next 0/6] wifi: ath11k, ath12k: RX correctness fixes
Date: Sun, 22 Nov 2026 22:05:19 +0100
Message-ID: <20261122210525.2076058-1-julius@bairaktaris.de>
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
  checksum, or a UDP datagram with a wrong checksum in IP fragments.
- By the code, every ath11k and ath12k chip and frame mode.
- Shown on the hardware with OpenWrt's ath11k, switching at run time
  between ath-next's rule and this check, 50 frames per case, 1 run:
  with ath-next's rule the AP answered 50 of 50 ICMP echo requests with
  a wrong checksum and 50 of 50 fragmented UDP datagrams with a wrong
  checksum, and counted no checksum error; with the check it answered
  none and counted 50 errors each. Unfragmented UDP with a wrong
  checksum, which the hardware checks, was dropped both ways.
- Impact: the stack accepts such frames unchecked (icmp_rcv(), UDP
  after reassembly). CVSS 3.1: 3.5,
  AV:A/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N.
- Workaround: none; mac80211 offers no switch for RX checksum offload.
- Found by reading the code with an AI review tool.

3/6: ath11k delivers frames under a forged source address
- Trigger: a station associated to an ath11k AP turns on 4-address
  mode on its own side and sends data frames with any source address.
- Reachable with frame_mode=2 (Ethernet decap) only. On the hardware,
  an ath10k station sent 200 broadcasts with a forged source: all 200
  reached the AP's bridge, which learned the forged address on the
  Wi-Fi port. With an earlier version of the check, which hands such
  frames to mac80211 as 802.11 frames instead of dropping them, none
  did. One run each.
- Impact: a station can send frames as another host, and the bridge
  then sends that host's traffic to the Wi-Fi port, where it is lost.
  CVSS 3.1: 4.6, AV:A/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:L.
- Workaround: the default frame_mode=1 (native Wi-Fi).
- Found by reading the code with an AI review tool, then reproduced as
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
- Found by reading the code with an AI review tool; measured as above.

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
- Found by reading the code with an AI review tool.

I used Claude (Anthropic) to help write these patches.

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

 drivers/net/wireless/ath/ath11k/dp_rx.c       | 86 ++++++++++++++++---
 drivers/net/wireless/ath/ath11k/hw.c          | 22 +++++
 drivers/net/wireless/ath/ath11k/hw.h          |  1 +
 drivers/net/wireless/ath/ath12k/hal.h         |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 14 ++-
 .../wireless/ath/ath12k/wifi7/hal_qcc2072.c   | 11 +++
 .../wireless/ath/ath12k/wifi7/hal_qcn9274.c   | 12 +++
 .../wireless/ath/ath12k/wifi7/hal_wcn7850.c   | 12 +++
 8 files changed, 147 insertions(+), 12 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
-- 
2.53.0

