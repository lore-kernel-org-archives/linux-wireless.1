Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795509165;
	b=0HFsGYg7cBfca3fUJEjd3Sp9lPnWU62dniU5qIbObcg7ppP7teWCEeoz63GA+8dL8Gu4
	 AfyCUI9ZynHc1ZpeFB1g5oFArqgFnFJoR13VR6Tp7DISGKUo2HYJTwVrMZJ90+2yeE5Zp
	 XAAN6PhqsSGrj/oFyMAnnxI6vx0hS1NwyJRHqOqOxf4m75fIfVF9IOHS7mC59IE2wRNpg
	 fNNIPu0Lo0KpHhClB12KK6j6FOiprHIyz+GmgqBcEKVtdb5VWoXBcpxRhej/WD1NgLo3T
	 dBv4jE4e888Eak7toqtpPUAZJYdqeTsRQIfZ+HgzP02VsXyLLQj2ffltW/KLItXgSMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509165;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=/XAAjHiTESZDBNmn1ytEsZHRFiHOgw+dZR5ob6jM43k=;
	b=rnYxmEPBU3KdnWtDg1pBAFYAYqAQOE1o3JxVUuIpLuznxHVlWsHLLPQwaiLQwE0iuQfN
	 AycmjznfSJTeZunm+4q81Je70u1fyyCMdk/FL5uYKor6a6oeRH5/avxiQVsbiUaI8sgG6
	 +VODQPTFmSjl1UFUvx7CtQFWIrYmYV7i+yW2H5MK+YMiXu9U8NUcaijinpytxBLDZ+Tko
	 /zXztwxvC0l6W2dntzA1u/N1JS65O/LmMytD7737cXenhCQI4Fq8LoO55fH9QdY5/OWTC
	 +kaaH4HcKee/XMde8qR7jpst5Le6phX1GYGlMGJcSfVYn/ieWsB69lz73jG796QyK4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=crsMHA6A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF05606A33E;
	Tue, 24 Nov 2026 08:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=crsMHA6A
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795509165;
	b=qecKbuXo803ib1JyIzIOF7qfueMq/MxUpQwO29fSmah1CG7MzsGQeV4KwVxXuu3o80Pz
	 /fw4Hu4vrg9nEpBWiGAwNl7KRXdveb8Hje2t67e0BGobMwpY8rW08mbg+eeqfhCYCwzPi
	 AKQYp2T2CMJlmWKn+M9+nxAVmCw8WTf5vlxdcPtaP2vzCxPzWBp+GZzVXVJ2QXl3PWmgw
	 ZK26pcGXbuCJafomMeBSjYZw6nFCBspZaDOgK9dXgmcVs6F8IGjYnPprNWaGv8oge+GQT
	 kt1TusfrWziFkOl9gk8z6bFt0YY6jnW6/3Ve5jSM72yOv72WnGbqm6GQwcg0B0JsDXg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795509165;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=/XAAjHiTESZDBNmn1ytEsZHRFiHOgw+dZR5ob6jM43k=;
	b=3uxxn4BDvQAI3ZCFB6feTRZ9WpvNYjhp7q+3oeNMS9wg6l9IP2/N8hQVi5YeWZMsxujr
	 6yvmvAqKKEO167Yd/QZTi0jpQNKwLNoUydNapnJJD7n2WsoTrRs5FujYWqpCFhAcXkYAa
	 h4FWbWaffh4YySrWKWOAmr79eAXzF0D+TgIfdeOx2uJX4Urbimw8DxVZaE5xTztyho0++
	 h9/8Zrjl7BHNJPPdElLlyaP99QVwDhDUcpIVa1VCv6DDCZiPfbflQzIZb7uhxliJJQ6ft
	 2mx2OhLoNtfeC4DgwTu9ofOPHYMrTUraT+Syzpsd6M3+emoZ3k+1qFJXgbNkn7mtSlA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 825A41F000C0;
	Tue, 24 Nov 2026 08:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795509165;
	bh=/XAAjHiTESZDBNmn1ytEsZHRFiHOgw+dZR5ob6jM43k=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=crsMHA6A6Iu78mSySA3OJL6Cbz5ollyvh8dq/49nhy9OPGz7ESnWXsiZwg5f//vTb
	 dHI2lQOoyLBuRPogePOeDWa4uiXzoIqQCUvN3oCJ/rgYujkntujmuq/WmwV7pJxRxu
	 DEGkOGSfs1tXh5UFS5CrCExOIWrgTDr4kW8vrv07pHAj3LNTH9Hf/YCj1wHzIyJ4BO
	 rmAlz11JiRoIbGV/Xl+u0j4w37yHxAT48aQupk5/zbtueoV7Xj2Y6DAvzFSLRz0yQE
	 yaSnaMtl4z/wPLK/y2TYkoUmbIJZrdME7V7D/Lv4+hNT7FQYAoDFQFvz2HCEiJ/7ff
	 sU0bjsl8FPE6A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D7C674C945;
	Tue, 24 Nov 2026 08:32:32 +0000 (UTC)
From: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>
Subject: [PATCH RFT rtw-next 0/2] wifi: rtw88: honour rate, retries and
 bandwidth of injected frames
Date: Tue, 24 Nov 2026 11:32:29 +0300
Message-Id: <20261124-b4-rtw88-inject-v1-0-f7457e496924@proton.me>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ7CIBBFr9L8tZMUJAY9gAcw3RkXpQw6LtAAa
 pOmdxd0+X7+ewsyJ+GMQ7cg8VuyPGIFtekw3cZ4ZRJfGbrXO6W0IWcolY+1JPHOUyEf3Db0e+1
 HY1GtZ+Ig8694xuk4tK0KFHkuuPwP+eWa27pY1y8yCr2zhAAAAA==
X-Change-ID: 20261124-b4-rtw88-inject-dfb3f092da48
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, Luka Gejak <luka.gejak@linux.dev>, 
 Bitterblue Smith <rtl8821cerfe2@gmail.com>, linux-kernel@vger.kernel.org, 
 Ahmet Zeren <niko3x@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795509151; l=2902;
 i=niko3x@proton.me; s=20261119; h=from:subject:message-id;
 bh=418Z9+5osAr5Zw2V0Hv6Br6WPMtAU3n8k5065gZHPgc=;
 b=mRUq7T0abH37TpK3Ri9sWXmIHYHnlOvjuV3C0QdBqgHJz1jhlGjbxCDSzw0oPS0A8I3TryjNd
 WtW+RjnefEpCchMEGCd1pYYpH8nfZ2QNPns3ZkVAKlrhUnxrfAf0nxv
X-Developer-Key: i=niko3x@proton.me; a=ed25519;
 pk=J4zNm2pudzQ/wF+pQ8xO+wW6jpcNa9EJ2C1g4DUAjhM=
X-Endpoint-Received: by B4 Relay for niko3x@proton.me/20261119 with
 auth_id=1575
X-Original-From: Ahmet Zeren <niko3x@proton.me>
Reply-To: niko3x@proton.me

rtw88 ignores most of the radiotap header of injected frames: the
firmware rate adaptation picks the rate, the frames are sent at 20 MHz,
and the radiotap retry count and NO_ACK have no effect. The same was
recently fixed in rtw89, and Ping-Ke agreed to take similar patches for
rtw88 in the thread "rtw88: injected frames ignore radiotap rate and
retry count".

Patch 1 uses the injected legacy, HT or VHT rate, bandwidth and guard
interval, without rate fallback.

Patch 2 programs the TX descriptor retry limit for injected frames, sets
max_rate_tries so the radiotap retry count is no longer clamped to zero,
and reports NO_ACK frames as such.

Non-injected frames are not affected. Injected frames without a radiotap
rate keep the current rate selection. Keeping the sequence number of
injected management frames (IEEE80211_TX_CTL_ASSIGN_SEQ, also done in
rtw89) is not covered here.

These are compile tested only, I have no rtw88 hardware. Luka offered to
test. A way to test, with the rtw88 device in monitor mode and a second
radio sniffing the same channel:
- inject data frames with a radiotap rate, HT MCS or VHT MCS, with and
  without short GI, and check they arrive at that rate
- set the monitor interface to a 40 or 80 MHz channel first (e.g.
  "iw dev wlan0 set freq 5180 80 5210"; mac80211 drops frames asking for
  more than the channel width), then inject frames asking for 40 or
  80 MHz and check the bandwidth on the sniffer
- inject unicast frames to an absent station with a radiotap rate and
  retries 0 and 6: the sniffer should see 1 and 7 copies of each frame
  (mac80211 ignores the retry count without a rate, and caps it at 30);
  with the NO_ACK flag it should see 1 copy
- a quick check that normal station mode still works
Please mention the chip, the bus and the band you tested.

checkpatch --strict, W=1 and sparse are clean for each patch.

AI tool use (Documentation/process/generated-content.rst): the patches
were written with help from Claude Code (Claude Opus 5.5). It was asked
to apply the rtl8xxxu injection fixes to rtw88, using the rtw89
changes as a model, check the descriptor bits against rtl8xxxu, and
review the result. I have reviewed the changes and take responsibility
for them.

---
Ahmet Zeren (2):
      wifi: rtw88: use the rate, bandwidth and GI of injected frames
      wifi: rtw88: honour the retry count and NO_ACK of injected frames

 drivers/net/wireless/realtek/rtw88/main.c |  1 +
 drivers/net/wireless/realtek/rtw88/main.h |  2 ++
 drivers/net/wireless/realtek/rtw88/tx.c   | 49 ++++++++++++++++++++++++++++++-
 drivers/net/wireless/realtek/rtw88/tx.h   |  2 ++
 4 files changed, 53 insertions(+), 1 deletion(-)
---
base-commit: 8b29fd95e2d3cb80564eb7cb34248b844422ba1e
change-id: 20261124-b4-rtw88-inject-dfb3f092da48

Best regards,
--  
Ahmet Zeren <niko3x@proton.me>


