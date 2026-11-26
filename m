Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.28.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706285;
	b=N+tG+ewgRmdEXvM95c1y9fEZID9cYJ+gW6et7gNsL6uS5L/DKmcSWpkeX5Oj5KjCXTMo
	 6XisMws7/lQKxWE2CkbLRCSV2P4uhCx2vvqYEcCb+/4WSvBmiydG+fWnQhUzv57pJLMoE
	 oc6Bo0gcsnwwa+PxnsnOUUERQShIRtT5f+s6lzOdc8xZvFARP60tLFl46DQAWv/SXh4Hu
	 ttft8A32pm4yIQ3TJrcdG5sSxV6QWaNY+PLrcso99DKNzfPzetZAfTEyCXE06iDEYRbm5
	 93szaBLDD++B+8ZSCupzDmfz4erp2Pf6nhyWlFMVQmIbehEQcbwzsQkcyUWxc/NLV4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706285;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:Message-ID:From:
	 To:Cc:Subject:References:In-Reply-To:User-Agent:Content-Type:
	 MIME-Version:Content-Disposition:X-Virus-Scanned;
	bh=4DgF8hp6sUqPzW0UDl/WML8kk+7aaZi9dtlV5oo7mFQ=;
	b=eWDbaJqeXIeNGOACHDpugmn5zg86DfDcB3dkF/7/bcDox2RvrcyjtV5eeqWtqhixHtxW
	 Z27kE9x8Gr0fD03wmAs1D20V0/hPVKUqT+/grC1rKgfQZpr0EC0ZEEEC6X6fTHkECxG4A
	 DUpRG1UVNomRoXgpjpidyLSpOoAiqzVYWlbT6QbcZxNYCtvfncruMr8WmcNFgKQZwa69N
	 yyWUCYzFwnO8H+mHCcwDbgnvildf3E5VDvWS3LqXPWeQ/Kxw+tnTOlhtKBjbLeY2cHXIh
	 dXwtBgsFwDd+KiuINpinvvrnWcH48BFnBCai3LsWu551mh5RvHGy2MUJeYpj6r93E3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfdeck.de;
	spf=pass smtp.mailfrom=rfdeck.de;
	dkim=pass header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b=WTkH6ia4;
	arc=none smtp.remote-ip=188.40.28.6
Received: from www226.your-server.de (www226.your-server.de [188.40.28.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661EA606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 15:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 661EA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfdeck.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfdeck.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b=WTkH6ia4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rfdeck.de;
	s=default2609; h=MIME-Version:Content-Type:In-Reply-To:References:Subject:Cc:
	To:From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=4DgF8hp6sUqPzW0UDl/WML8kk+7aaZi9dtlV5oo7mFQ=; b=WTkH6i
	a4sPIeHI4it66/ciHyW/Y3eD6CMvcJW6XHjh8WDyzOuFQKK0/6zfAedrwDqZy/xaoYfOhbFtX5Yy1
	GSnK4CtPxbjyZkz3pLtB2Dde9zjR3GWzCJ6KAgN3MN1aorCaJ6tUE+kP/OKoBQ87iZYpMUdJl9PrF
	5F62tTaD0X4Q2Vy1ZcFC8K4icIDsIy/WluzFQxUvRNFssLU3IEQhS/JDIQkQ/5NufNIisHQ3Y/O7N
	ic77dE6kO4T45m3LfFqeWc1NUehSW9Zk+mnBOLIu+2U2Sv2ozSuyj0WDyYLnGF6jAXKH+vK/Skr30
	6Yl19+Xl2dKE6kR5TSMoG/isJw9g==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www226.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <martin@rfdeck.de>)
	id 1xWbEX-000Hd3-2n;
	Thu, 26 Nov 2026 16:18:01 +0100
Received: from [192.168.0.34] (helo=mail.your-server.de)
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@rfdeck.de>)
	id 1xWbEY-000J4x-0R;
	Thu, 26 Nov 2026 16:18:01 +0100
Date: Thu, 26 Nov 2026 16:18:01 +0100
Message-ID: <20261126161801.Horde.EPNAvNvUumt6-YVgeu2ZpuH@mail.your-server.de>
From: martin@rfdeck.de
To: Luka Gejak <luka.gejak@linux.dev>
Cc: linux-wireless@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>
Subject: Re: wifi: rtw88: usb: AP sends no beacons after monitor capture on
 the same phy
References: <20261124144427.Horde.qQ_UTCx-6LmjjeS1bojTj8-@mail.your-server.de>
 <D34D5E6B-B159-4F34-92D8-4264024D3319@linux.dev>
 <20261126081256.Horde.ilxldEFeRo6UQJajd_7Nd6S@mail.your-server.de>
 <a0827be820914280cca81b32b495cda655a87fb4@linux.dev>
In-Reply-To: <a0827be820914280cca81b32b495cda655a87fb4@linux.dev>
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: Clear (ClamAV 1.4.6/28194/Wed Nov 25 07:26:59 2026)

Hi Luka,

> Could you try the two AP starts you suggested with just iw? Set the
> monitor to channel 6 once and leave it up across both runs.

Done on a second box with the same kernel (7.0.0-43) and an RTL8812AU,
driver reloaded before each run, Kismet not involved. The monitor was
set to channel 6 (20 MHz) once and stayed up across both APs, no
channel changes, 15 s before AP1, 12 s per AP as before. The base
interface was down before each hostapd start.

That triggers it: AP2 was silent in 5 of 5 runs. As controls, with the
monitor created but set down before AP1 (3 runs), and without a
monitor vif (1 run), both APs sent. No rtw88 lines in dmesg.

> Could you read one byte at 0x422 with read_reg just before each
> hostapd start, while the monitor is up?

                      AP1 beacons  0x422    AP2 beacons  0x422
   monitor up (C1-C5) 117/1/116/   0x71     0/0/0/0/0    0x31
                      116/116
   monitor down (x3)  109          0xea     109/109/108  0xea
   no monitor (x1)    109          0xea     109          0xea

So bit 6 is set before AP1, clear before AP2 with the monitor up, and
set before both APs when the device was restarted in between. In one
of the five monitor-up runs AP1 itself sent only a single beacon (190
beacons from other APs were counted in the same window).

The TSF again keeps counting with the monitor up (about 21.5 s at AP1,
39.9 s at AP2) and starts at about 4.7 s for every AP in the other two
cases.

> hostapd_cli -i wlanX update_beacon

It returned "OK" every time, and the silent AP2 came back:

   run  first beacon after  beacons in the next 10 s  0x422 after
   C1   0.08 s              95                         0x71
   C2   8.12 s              2                          0x71
   C3   0.01 s              95                         0x71
   C4   0.02 s              96                         0x71
   C5   0.05 s              96                         0x71

C2 is the run where AP1 was nearly silent too.

Thanks,
Martin


