Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778054;
	b=wvzqIs5Nl46r+f7fjXq/Kpe3/ePtpX7XEndXPx5qQaxRS08gdCBQ4UjL85bsQmoABobs
	 too4fIKbcFxsXcKIrXMI15PMdPi8KU2ILsaz3QQjOQdkEUIPXK7bFgLGHi6i/ZmuoxuY9
	 nBGyW0lMei72Y90lAIEr0EprMVpTLwF+xLG/IbxUokkMcZz70scvIUBjV6JKgcWx4AcO+
	 xNOyIMCM2byDadGr6Y5ldd6PTAVQxpPpUZIaTVYA/6mVMfLZ4+tm159K2ucEs50LmpC/T
	 MGOSlaRYQjQoAjaCDDg7/732e1FCQTXFSgfvsSmZWA1hyVqe3+jM7Gtqa5GhR8ARYWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778054;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=45D3EtS2T3P72r4Xe8iEzS/l3yKRZym4kbtOTG+qyP4=;
	b=ImTZAzkNuyy12emPcblPFiAE4R7A3kSxweJ2OY4tuPk+amjEiMY0EQESn3PKbEiHLAKX
	 SBZpu4PbnGCzu3RIu697qTYUqghLSFHWL2y53u/iZ5ooyff/LbCGycX+jv8q/YFuuVaZp
	 Nvya6LaPlzzWStXZRJlrK6v7TXY8woukJ1bTr7xPc8X4/J87s6XZAIZwMfkun51LVzvwQ
	 YS48OXBu30+5ifyPJiiCT2W7muBuLLtbfY46FnK+zbYiDZtktUrFYXU2302fRmzqKc0pD
	 ukw1UfW7OgnhxIDc6ZCFmp0eEK/a92MBSaM36MjLziPjvQiflseMS1O3bThfETi43KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GD553rQz;
	arc=none smtp.remote-ip=95.215.58.122
Received: from mta1.migadu.com (out-122.mta1.migadu.com [95.215.58.122])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48220606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 11:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48220606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GD553rQz
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=45D3EtS2T3P72r4Xe8iEzS/l3yKRZym4kbtOTG+qyP4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795778051; v=1; x=1796382851;
 b=GD553rQz1SixzhHqZaHyVxOtgItzMGwCf3SoqhAlL7wOeNOJbRshJGKY0N95LNP1jUfrcN1e
 C3a723/0K0RZYgKaoT/tMVcsDWyrGtvBYKo68wo0XaE3BbJyeK8nMtHpGc10TalS4Ve8kOR+IuI
 Cr9BNGGAxo+SWOmNsbbtwWUA=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cf23869d349a7b62;
	Fri, 27 Nov 2026 11:14:11 +0000
X-Mizu-Trace-ID: cf23869d349a7b62
X-Migadu-Flow: FLOW_OUT
Date: Fri, 27 Nov 2026 12:14:06 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: martin@rfdeck.de
CC: linux-wireless@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>
Subject: =?US-ASCII?Q?Re=3A_wifi=3A_rtw88=3A_usb=3A_AP_sends_no_beaco?=
 =?US-ASCII?Q?ns_after_monitor_capture_on_the_same_phy?=
In-Reply-To: <20261126221229.Horde.Dolx0es1tv-1dHtbdt7kG6e@mail.your-server.de>
References: <20261124144427.Horde.qQ_UTCx-6LmjjeS1bojTj8-@mail.your-server.de> <D34D5E6B-B159-4F34-92D8-4264024D3319@linux.dev> <20261126081256.Horde.ilxldEFeRo6UQJajd_7Nd6S@mail.your-server.de> <a0827be820914280cca81b32b495cda655a87fb4@linux.dev> <20261126161801.Horde.EPNAvNvUumt6-YVgeu2ZpuH@mail.your-server.de> <41ae89e5a8328124062eea53eab2fc49d6114a56@linux.dev> <20261126221229.Horde.Dolx0es1tv-1dHtbdt7kG6e@mail.your-server.de>
Message-ID: <ABB4AE9E-9CB7-459D-AAED-481703358D3B@linux.dev>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Martin,

Thanks for testing the patch.

On November 26, 2026 10:12:29 PM GMT+01:00, <martin@rfdeck.de> wrote:

> With the patch AP2 sends. I built rtw88_core from the Ubuntu source

The four runs with normal beacon counts seem to confirm the queue enable
order caused the repeatable AP2 silence. Thanks also for offering to test
the formal patch.

[ ... ]

> never with the monitor down or without a monitor vif.

When the low beacon count happens again with the patch, could you keep
the same hostapd instance running and bring only the monitor down, then
up again? Please count our beacons for 30 seconds in each state, starting
with the monitor up. Keeping the AP running lets us change the monitor
state while the device stays powered.

I think that would help show whether the remaining loss follows the
running monitor or persists after it goes down.

Best regards,
Luka Gejak
