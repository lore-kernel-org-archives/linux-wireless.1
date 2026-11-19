Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795126171;
	b=1kJf/XPBJ36mk12JA1rCL5o8HAIPlO11wK0+JDeRprfPBzH6uaCeOVl40qjGJ4m7YC8n
	 BHrsWkrFjQ7IyEK4Gij6dXkoG9mtVOsG7HM6gIxp59tGEoSDUEZTJI96UbzTO2IcfDLWK
	 oz7BrvQBzxd1M1NnnaIb4Fcnnopfik0vg0MEnVqSoTCLhZfHwJ2GjN4mRIvGXYEKtDaW4
	 7yDb+CZXhEhj7sfarC9C++RWHCjc77+pjXDKoSYhkiwPcwj/4IfnT+ISIo7kM/V0dROeI
	 awjgByDX3qyppKIP8mf1wh68tOtgAtW6xGTRgWckc8TegRm1IKIFVLc1UeKYpHuckEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126171;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=XPxvPb39NSvD3D9zrezUHpugHTXqKDOU24ae3AqQY3Y=;
	b=LmasF4q2agKYwiTlkbLcnKKZeAK2bThVRvXZ1x/PNSoLgIAo9VTwurpo0oNV1EXuCHHv
	 Yy2+FNUwCYD/Xf4tw31nfCxIducnNje+v+Znildqs5qG8amcoIsJekq/+6PB5Ve/BPumx
	 OZpPRk8QsBCF/IDcxeQJXsm/vYeHNfCd6EbcDvXBlKlkD4DvlQWyi0ADdyLy2T4+Or/hN
	 7PvFcqNlxA+LBNY3gNu9i8tb6Yex+BqCHuRykYa4NAOXO2JMhdyhzecf5CUiYVKts0W0n
	 e7iPGwWIAD4+rRQNbEfiwStZdUAODT07HCb3UWRbIlfhKY9FlUI5pcrXcg7yhQ7izLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KFJssR9O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EE5606A33C;
	Thu, 19 Nov 2026 22:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KFJssR9O
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795126170;
	b=rNKqSyoaEqtBGNWorgg4Z5f4woLVp3aL15mJgNs1pdy2cW6HpuZujrRbYGU9RhN0pQ1S
	 cJdkoLfVf6kdgF6BB/nFxSSmJRDDG5ctdvth5++zM5sMgGAa9r6oH9A7IlRNs3HYbj2TC
	 r9zlnpCCsEtsNi9RLt6h7u2nCI1txPR1BGbYiaY50Jofa3p2MOK+XdITX5rjlAMRzVfHG
	 D7l/vF2U3kTvQ2YrcqgqB442kqzrAn3YZv1zcLZQqNKUivEMPhi3uLOftVKHYVKfcvt45
	 MwtDM2ijpcixpU2Jly1xCoJGq3dpYzkPsr3Jyz7/ye3jAAjSazZgh9tZ4hdCb2N8OQQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795126170;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=XPxvPb39NSvD3D9zrezUHpugHTXqKDOU24ae3AqQY3Y=;
	b=Ee59ppaIbzJCAS1Q19K1Uq/GSoSaR4yfFAPMbkIHbGUHIY5QQKJ9wCGuQCGJKi4lN3uW
	 YlDXh959wwg5kchXjcxjgJ+0lhGVxGCXQbycug9lTTlB+Pin2g6CZEFuaegTH5i3xlPVD
	 Wj5EYAa81NWFlO79LfYUx0twBlgMb+OwowTT7WTrT5+XUlu2l1Srd5tAJAyq7o3bgI5zr
	 p7+m3CDXMl9I4aMzv9zgaiPtPHNF7a/r2vztmQfQbBqSCguJwy6PnNu057XjPEJKnUAds
	 Gzh2GXbQt6hxb9ESZHP8U7khwE8UKDqnQhJmoq+fdrh4JnB94PefFpZm1tMP0slHNDA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 67F3B1F000C0;
	Thu, 19 Nov 2026 22:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795126170;
	bh=XPxvPb39NSvD3D9zrezUHpugHTXqKDOU24ae3AqQY3Y=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=KFJssR9O/TyFAY2wr9gkBpB+GZR+Snv1f0WZX0oDv/rX9s2GkO3vsYB+2WuIeRl6j
	 Su8LwS1t3jG5mEIw+v2t6AI7Wlq16MO/dBausXFzrZh3PdbaBMck3h8zWctMHz7p1c
	 s6CEJ2pfwNzoXTZPgK2vvUabG7upZ1UUbZAMBnNBAsiqDaSqbEBL25P+4sKFh0IC/s
	 ggEi82/54jVIoUjD1a/zKPr/WQTbs1MfOrgce4/8F453Ee8jw17JOrtLOvgxPs+B62
	 tCtDAHxPKZERK7+UmkaC72m7UCztFQHvHDBJlwhxtHS1K/vJqDZhs6xgQp7Y2C4pH7
	 k4YURIDA2mGiA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D7DFF41B07;
	Thu, 19 Nov 2026 22:09:29 +0000 (UTC)
From: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>
Subject: [PATCH rtw-next 0/3] wifi: rtl8xxxu: honour rate, retries and
 bandwidth of injected frames
Date: Fri, 20 Nov 2026 01:09:27 +0300
Message-Id: <20261120-b4-inject-v1-0-1e1693af0c6b@proton.me>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMMQ6DMBAEv4K2zknYIAj5SpQiNme4FCayHUBC/
 D0GytHuzIbIQTjiUWwIPEuUyWdQtwJ2fPuBSfrM0KVulNIlmZrEf9gmco2rjb23VdVp5P83sJP
 1bD0R0kKe14TXtcSfOaQjhX3/AzUvjSp3AAAA
X-Change-ID: 20261120-b4-inject-f6f4bc873392
To: Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ping-Ke Shih <pkshih@realtek.com>, Ahmet Zeren <niko3x@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795126169; l=2447;
 i=niko3x@proton.me; s=20261119; h=from:subject:message-id;
 bh=wIWSBvsZagGyK7K273K72Z/OcMBhty/IqhzJyzOyBko=;
 b=U3R2Pco+Xmj2bsVNtdyeC5YzFxciqXsIvMCA9n6bMXQ5sdbxrZFdNciMSslAs3hDRiYThUjuS
 AzKpAyYQ95OBt05gufLlm5wxDi+5I/mgnAJRo0fhS9q4Yrb8R1OEDE8
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
Ahmet Zeren (3):
      wifi: rtl8xxxu: honour the rate of injected frames on gen1 chips
      wifi: rtl8xxxu: honour the retry count of injected frames on gen1 chips
      wifi: rtl8xxxu: honour the bandwidth of injected frames on gen1 chips

 drivers/net/wireless/realtek/rtl8xxxu/core.c | 78 +++++++++++++++++++++++++---
 1 file changed, 70 insertions(+), 8 deletions(-)
---
base-commit: 0bdc579dbfc251a6b6838ee9459b6771b948c617
change-id: 20261120-b4-inject-f6f4bc873392

Best regards,
--  
Ahmet Zeren <niko3x@proton.me>


