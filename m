Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.208
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793989821;
	b=MTX4gix7zSPNI/bGbPf7NCxKH3Xq6r7YaVFLV9ElLaxPN6TdxVyV27XZ1VVw5ds3p1zV
	 Og9msNUIuR7nKgVzb5wNT3kyPvB1FHOoQ8iMkVKfsy1uo9xDL83PDHZ31iPYbBSs3ow0g
	 4OSRaktjO0y+Af4YLv86c6TstKEk1CJjHoME767EY0ajnsrBykBNq8r7RMwZHl3s2mRQY
	 iGLADyflyIHsU7JwvxfV+h8r4mD/ipCU8C4XjyZAQN+Yl3/YPUr2ih88WhRiLehWdPpO+
	 5VuCPBxagq8LZOHtpQATYeKDqDvaj0MIwZWi7TqUl9etsshXFDzlbTqCe0ISipdHkzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793989821;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4zS1QWUHwSOBAkfOexvAjjcm+lZUFWgZmqWL0fBlrBg=;
	b=2JvuxPJ05915ie12SxIyXrGgd20S88ZV2p4qlkGV6QJ9VKoqm/IlMQ+QZkCEIBNGJAbr
	 Yzl5zlYWow2NWm6An7aCUS9fx3H13ART1kBqKXNYevljk8gIIPB3kE+L+zdJuEmnfac84
	 slJmgGmCrRV62HUlm3B6MyOxNVbmA7OMcAqz4EIldMnLyyf5g1s48Yb9Xb1T0XRFfLeJI
	 1J+74GmMdLovH1dXieHUD6mpd54kYH6Y5TXAAYz+Mauq0D6cOp8u3HNWIJqANlFq7Tmtd
	 EqPFqvDcVLEv03kmm0beT/NC4oNBdXVrFfmfI7sTHJoLBIYniQC0MQdsPWIYJ7iluXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=kiO+oavE;
	arc=none smtp.remote-ip=91.218.175.208
Received: from mta0.migadu.com (out-208.mta0.migadu.com [91.218.175.208])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296C5606A326
	for <linux-wireless@vger.kernel.org>; Fri,  6 Nov 2026 18:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 296C5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=kiO+oavE
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=62/U3bQuxJc81dT7FTL+9I7s8M81bhkBluzi6hVHCNc=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793989817; v=1; x=1794594617;
 b=kiO+oavEVdEET1hgqT7nCr3puGyMAMugw2HCjVroHeph7L0urIfLDsIriH8oCvv3kYH88t7A
 pZjP22++iA15LRwp9804q/rizynK7vVLekWwh+UHRt6wkk+26GzQV/lTcnzgUKLv0hX4a+4F7CA
 wKr4CQSE2pNhbbkIWjuqwSy0//A6FVzTnxvYrR9td0CriPajbDS0ddORveIfEUuHvcvCzjrXtbl
 AL+38QohHwAQuDQXPj2DXj2OY0E+Qt0xTtAv5RQJdCOvf/wNkSSfR2Pz3foQOfrt0neQR5PoBtS
 7vDYrpCTX/Wih5fSTZWxJ38PDHvkMAF7/VE5m5WVGlxIA==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7e8b92ecf7e6c38e;
	Fri, 06 Nov 2026 18:30:14 +0000
X-Mizu-Trace-ID: 7e8b92ecf7e6c38e
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Sven Besser <sven.besser@sql-ag.de>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	James-LY Huang <james-ly.huang@mediatek.com>,
	Jacobs Wu <jacobs.wu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH wireless] wifi: mt76: mt7925: add the common scan IEs back to probe requests
Date: Fri,  6 Nov 2026 11:30:06 -0700
Message-ID: <20261106183006.12356-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <FRVP281MB5672F901E7D26533F6DBCBCBA0762@FRVP281MB5672.DEUP281.PROD.OUTLOOK.COM>
References: <20261102190811.7498-1-lucid_duck@justthetip.ca> <FRVP281MB5672F901E7D26533F6DBCBCBA0762@FRVP281MB5672.DEUP281.PROD.OUTLOOK.COM>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Nov 06, 2026 at 08:19:33AM +0000, Sven Besser wrote:
> Without the patch the adapter is never found. With it, it shows up within
> seconds, GO negotiation, WPS and DHCP succeed, and screen mirroring works.
>
> Tested-by: Sven Besser <sven.besser@sql-ag.de>

Great news on the real sink, Sven, thanks for trying it.

Funny timing: a couple of hours later Felix picked up MediaTek's fix for the same bug, so mine's superseded. Theirs uses the separate IE set you'd wondered about:

  https://lore.kernel.org/r/20261106083004.3156085-10-james-ly.huang@mediatek.com

I tried theirs on my MT7925U. It still finds my test peer, but WPS and P2P now land ahead of HT instead of at the end. No idea if any sink cares. Yours would tell us.

> while the station interface is associated to an AP on a channel the GO
> can't use (5 GHz channel 100, DFS, or 2.4 GHz channel 13), we become GO
> on another channel (5 GHz 36/40/44) and group formation fails.

Their series also changes how the GO asks for its channel:

  https://lore.kernel.org/r/20261106083004.3156085-7-james-ly.huang@mediatek.com

If you get a chance to try Felix's mt76 branch with your sink, it'd answer both. No rush.

Felix, Sven tracked this one down on 7 October, if you can still add him:

  Reported-by: Sven Besser <sven.besser@sql-ag.de>
  Closes: https://lore.kernel.org/linux-wireless/FRVP281MB5672AE5BBD61EF0802D42370A0942@FRVP281MB5672.DEUP281.PROD.OUTLOOK.COM/

Devin
