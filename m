Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795327175;
	b=tS9VsZMGb7AjZffit7pFpqy39lZL8iDhnxuEh3jHhiu/DZ0OyJjT2iEQuNe4BJyq7kKa
	 G6X7yMLJfvdt5IFawm212SVWJGsyDNOfPrHbQeGTuW7/mjfdyCBPCT8qbStH+2yyXGS9D
	 UOE2ifvfceshOVb1lszKaop5/8oGwrreQaP4lckGrv/4iLkkO2/WzpcZ/j9gaLv7yc5i+
	 a7quJr7AJU2+Ampo1b5aeLmPs/XSrwSKwS4OYn93a0c/W7byP//ismjFFanrA0HEQr426
	 7vtDj5yaUm7ep/TVKHZt6xGZWrAeh9RF6wLCUpKVeFZUE4gKevmImmzJ703mQXbkPxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327175;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=Q8HvBd0m5ETuM/U1Z21O/wHzbBU3ycMeq6aPqWPnGJ4=;
	b=hSmZkW6vMiUjfXSUoWUpfIw5vbgpBeDdpDxDeqT0uC0r4Yy1taYrx7lpASzDd+GOblTk
	 0FGN4Bxjnj10amp0CE3TznvRFLsoa/qFiFCzlfZ0j1L/nPIaRWieI9gQuOOBvnM6aQNyv
	 r+SrCfqOPH4fNIJbLpU0wBl1rB8oax5aSyQ9+bE/N39ijm3Pkxvae0Y8kBfBd5dtSxmBM
	 QsoSxQWUGyoeZApx51j/5rMj+BG+Y1Oyccj/wg4SCZI0F1JWNV1flh04pJY/201l5Rkla
	 +hKc5hpevU92xX5hOO+zA+DCiNnKYoBw/eGts9z+LzEFuqFEb7kWI57Hq8bm5ozv+7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O1wTd1hk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAC7606A333;
	Sun, 22 Nov 2026 05:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O1wTd1hk
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795327175;
	b=hZt3NGcKuGcLlVXR69JOuLmXVhX9dtWqUMdYjPI00Htv3Wymimqn66yUeUPrY3ZCO1lV
	 gfk5nSQnk0e5jD/vGCA//xXQFk5/QGxJ3tiiB8VKoH6m9VWS7Yq2dKeFWfeGsf+N9Sgeu
	 //ZVjdZsS41FnKLNTJeBopWy3fr72isVd06rQTGC8O9PPtyI9TQsEepnP2c2I8RaNLOv5
	 hMqxuDgQPU6JCXLFacimDc4GZZFOaBLXgBb74a1T8O/oGbi+EIj6nV1R+kQllcdBXBv32
	 xaq9z1Mrvgm9yiF6KMMnBDijT9u7rYJ7XWrpsB+Ld4h18l9ESpTqWKJc0u2Mlz6sLiQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795327175;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Q8HvBd0m5ETuM/U1Z21O/wHzbBU3ycMeq6aPqWPnGJ4=;
	b=Cn3bPj5SiI6D9QowEA0zOPGolVU8bCSrtLyi4o41pcpSAB6wQjhnCZAoHvZ7h3itNM0M
	 vG0OoPVtO18gxPlHo3ROfmUJAIZZ0903IWP6znfVE29Ti0My/xiL88A1ZtEh7M8kg+Rcz
	 zudm54nqzC0slmqOwVquuYiqdF1ecLJOfBhdRLVxqSLKm5zUCzndTKJdNCJ/Kw6MYKgv1
	 9tF6vgUSAaBOtjG7C0FbGNljeLcOKTUeiubNCABnwfdlynb2L7mt7XZyu6Vb+4B0gcmi4
	 IjvoyLqSWpzrbZq7FkzsBgjlwkS0X8G4xWJziubDr2705dDQ9EsCOH5KdWDfIpNqvSQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12D6A1F000C6;
	Sun, 22 Nov 2026 05:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795327175;
	bh=Q8HvBd0m5ETuM/U1Z21O/wHzbBU3ycMeq6aPqWPnGJ4=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=O1wTd1hkpG9U94VdMXU+ZcvnVdaBFGo3wGj6Ow778/Pjjh/QCi5FB5Ug+xvpZz27c
	 fwDvS+AOnZ/Z4LxWAtEiKQwJ1yHNz5ulKg73pY2JpxUTr4tpVMlRe/eFBHPlrnci5i
	 4bhfwQsrzkwKaOjiK95bhOqz5uXFOw9GAkXFY/I7i34iLcVZ0Bejc2u1jzrXeeACYr
	 KL7RYAeclLj22IOQh83X+o+Vo+4bE4UyS+8W8yU94O4tXXYnNdktNpTx9NYhomYI0r
	 +7HEjo9bX03l08TCwBoXe/d1g7/1p63/0F3g52/dpf6AVm5c7TaPEieCVLp5lUkyj7
	 6EXJNwTj9e2dg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 676C44BF6A;
	Sun, 22 Nov 2026 05:59:33 +0000 (UTC)
From: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>
Subject: [PATCH rtw-next v2 0/3] wifi: rtl8xxxu: honour rate, retries and
 bandwidth of injected frames
Date: Sun, 22 Nov 2026 08:59:28 +0300
Message-Id: <20261122-b4-inject-v2-0-0ee720fe706d@proton.me>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQ6CMBBEf4Xs2TVtIVU88R+GA61bWRNb0lbEE
 P5dwKvHybx5M0OiyJTgUswQaeTEwa9BHQqwfefvhHxbMyihtJRKoKmQ/YNsRqddZez5VJa1gpU
 fIjmedtcVYn6jpylD+2vSy2yjTbWxPacc4me/HeW++PMwShQoSeq67Jyw2jRDDDn445OgXZblC
 37YnY2+AAAA
X-Change-ID: 20261120-b4-inject-f6f4bc873392
To: Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ping-Ke Shih <pkshih@realtek.com>, Ahmet Zeren <niko3x@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795327172; l=2971;
 i=niko3x@proton.me; s=20261119; h=from:subject:message-id;
 bh=lWc6DKtgjxLILVy0Q8VxPg5yRszEjJKsrK5kKIhso0E=;
 b=wPMBny5Tjwt0nQN3TpuEGo6SSCgj19tBysD9Uhi5ZdScsErgzDziQEtgKb/g5yHO4/hjpjmki
 /I7goFXSzYZDreMz8PHPcbntyHJ8nzXeb4mD8AR3Udj51KyGChLFBwf
X-Developer-Key: i=niko3x@proton.me; a=ed25519;
 pk=J4zNm2pudzQ/wF+pQ8xO+wW6jpcNa9EJ2C1g4DUAjhM=
X-Endpoint-Received: by B4 Relay for niko3x@proton.me/20261119 with
 auth_id=1575
X-Original-From: Ahmet Zeren <niko3x@proton.me>
Reply-To: niko3x@proton.me

rtl8xxxu ignores most of the radiotap header of injected frames. On a
RTL8192CU every injected frame went out at MCS 7 and 20 MHz whatever was
requested, the retry count was ignored, and NOACK frames were retried up
to 48 times. That makes the driver unusable for tools that rely on
fixed-rate injection.

Patch 1 makes gen1 chips (RTL8188CU, RTL8192CU, RTL8723AU) use the
injected rate and guard interval, without rate fallback.

Patch 2 makes the radiotap retry count and NOACK work. max_rate_tries is
0 today, so mac80211 clamps injected retries to zero, and the hardware
default of 48 retries is used instead: unicast frames to an absent
station then stalled injection for over 100 s in my tests.

Patch 3 sends injected frames at 40 MHz when they ask for it. Only QoS
data frames get the 40 MHz descriptor bits today.

Frames without radiotap rate information are not affected.

Gen2 chips and the RTL8188EU use other descriptor formats. Patches for
them follow as a separate RFT series, since I cannot test them.

Testing, all on RTL8192CU (0bda:8178) in monitor mode, received by a
second radio:
- 1, 5.5, 6 and 54 Mbps and MCS 0/7/8/15 with long and short GI arrive
  at the requested rate (stock driver: all MCS 7).
- Unicast frames to an absent station: drain time grows with the
  requested retry count, NOACK frames are sent once.
- Channel 6 HT40+ and HT40-: MCS 0 and 7 requested at 40 MHz arrive at
  40 MHz (stock driver: 20 MHz).
- checkpatch --strict, W=1 and sparse are clean for each patch.

AI tool use (Documentation/process/generated-content.rst): the patches
were written with help from Claude Code (Claude Opus 5.5). It was asked
to find why injected frames ignore the radiotap rate, retry count and
bandwidth, write the fixes, and run the over-the-air tests above. I have
reviewed and tested the changes and take responsibility for them.

---
Changes in v2:
- Patch 1: drop the comment above rtl8xxxu_tx_rate_inject().
- Patch 2: set the retry limit together with the management frame
  case, so the field is no longer cleared and set twice; use
  le32_encode_bits(); add TXDESC32_RETRY_LIMIT_MAX for max_rate_tries.
- Patch 3: declare bw40 on its own line.
- Collect Reviewed-by and Acked-by from Ping-Ke.
- Link to v1: https://patch.msgid.link/20261120-b4-inject-v1-0-1e1693af0c6b@proton.me

---
Ahmet Zeren (3):
      wifi: rtl8xxxu: honour the rate of injected frames on gen1 chips
      wifi: rtl8xxxu: honour the retry count of injected frames on gen1 chips
      wifi: rtl8xxxu: honour the bandwidth of injected frames on gen1 chips

 drivers/net/wireless/realtek/rtl8xxxu/core.c     | 76 +++++++++++++++++++++---
 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h |  1 +
 2 files changed, 68 insertions(+), 9 deletions(-)
---
base-commit: 0bdc579dbfc251a6b6838ee9459b6771b948c617
change-id: 20261120-b4-inject-f6f4bc873392

Best regards,
--  
Ahmet Zeren <niko3x@proton.me>


