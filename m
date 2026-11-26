Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.28.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795727553;
	b=GbPT2poYVQI86zoITdVAVIJUgsGKKQv7Z1YYtmL6Wtrw8cK7/HsBO9yUpUBB9iP+qLny
	 zOQVWav5+1+KjEZnA8Cbqgc/Q3hjAoeFHOkETET97EKwIcIL2+2/lsfG++tTdSiaFnps6
	 hBTfXCRjXq11S9h1uYmQRWKp4+KDaGTsNF/1BUdfsU6FZcn1GRmnWYs4GtdQl7vBe/80P
	 FER3vyx/8HeWX5YnhL1lCEkuEnZSQxYF/cSvGppcXMZzCXfp43G7xzdjXkvP683jEOM5H
	 HvUsRkTuEAdWT4PW8iwLCwjIIYDjTiiNXotjvdFLDeMCnyQGUj0HfC5OWyXRBd4nlCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795727553;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:Message-ID:From:
	 To:Cc:Subject:References:In-Reply-To:User-Agent:Content-Type:
	 MIME-Version:Content-Disposition:X-Virus-Scanned;
	bh=CNq8rCGKHiy83by7xTyuYQMOJ+RL3prB4ClPyk/NY3Q=;
	b=XMNbTsVpZtjQquE8tqILTxrkhvH8Ifo88ewzs40a78jsVGZZFCQN6JB0MLCcGRZ2EmJ7
	 TFMMDLcU7xLnVDJk2TQwaurYAA4kk4MB6nJs0Y3PLNgVr2NrjDCZbK0cb690qDBvSXos0
	 UXqBqoX+wjMMwzbwj4Z9SiJnm0lOiakgHuFFiinezfFrYnAxPPt8VIkV+4pu2b8U+FiVN
	 2isAjb9bAKbugYCmxVByEHN/Iyr23/g5Mswzya58EiLaZrrQEL+0ycPW+4UYauSNG1ZaC
	 pih/sdpUhKcRg8LRnWDEqfVKF/rfzR/5Kzs9IB9sN6merFgZ9KiXPqr5KB46boI2DcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfdeck.de;
	spf=pass smtp.mailfrom=rfdeck.de;
	dkim=pass header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b=RWsB6sll;
	arc=none smtp.remote-ip=188.40.28.6
Received: from www226.your-server.de (www226.your-server.de [188.40.28.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423EF606A31E
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 21:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 423EF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfdeck.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfdeck.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b=RWsB6sll
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rfdeck.de;
	s=default2609; h=MIME-Version:Content-Type:In-Reply-To:References:Subject:Cc:
	To:From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=CNq8rCGKHiy83by7xTyuYQMOJ+RL3prB4ClPyk/NY3Q=; b=RWsB6s
	llfc4j/Gj44y2JhQVpTqPCsmbewLfaiaWmIJyQeEg5nDlSbKq+VliE3F5DYfsCTWOQV/5WlXoaA/n
	q5H8hsxNAmmDY2896Teq/glwWjXoKzMeEmCmcEwY4fswgRjcm4IG3fr1F9/6ot/8kedkZj2plHV9w
	L/tKwhH3FbxqH9CpqhkCVtenK4e8mBKcOoAFUYlA5deuJPxuBMV3ItxCdvmwDu9QtC8noTqNjRe3I
	pGO600NxgFfbXmk9uVk4oF3p4JzgwZC2a2fCEeA6JZknDeWGv/9+RO1M8P9Mvh9G2gn178+GjwAXN
	Jvm2v/KHQcTAKUWwWp1xCRzGGyiw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www226.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <martin@rfdeck.de>)
	id 1xWglZ-000Kc0-1j;
	Thu, 26 Nov 2026 22:12:29 +0100
Received: from [192.168.0.34] (helo=mail.your-server.de)
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@rfdeck.de>)
	id 1xWglZ-0009s5-2Z;
	Thu, 26 Nov 2026 22:12:29 +0100
Date: Thu, 26 Nov 2026 22:12:29 +0100
Message-ID: <20261126221229.Horde.Dolx0es1tv-1dHtbdt7kG6e@mail.your-server.de>
From: martin@rfdeck.de
To: Luka Gejak <luka.gejak@linux.dev>
Cc: linux-wireless@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>
Subject: Re: wifi: rtw88: usb: AP sends no beacons after monitor capture on
 the same phy
References: <20261124144427.Horde.qQ_UTCx-6LmjjeS1bojTj8-@mail.your-server.de>
 <D34D5E6B-B159-4F34-92D8-4264024D3319@linux.dev>
 <20261126081256.Horde.ilxldEFeRo6UQJajd_7Nd6S@mail.your-server.de>
 <a0827be820914280cca81b32b495cda655a87fb4@linux.dev>
 <20261126161801.Horde.EPNAvNvUumt6-YVgeu2ZpuH@mail.your-server.de>
 <41ae89e5a8328124062eea53eab2fc49d6114a56@linux.dev>
In-Reply-To: <41ae89e5a8328124062eea53eab2fc49d6114a56@linux.dev>
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

> Could you try the attached patch with the same fixed channel test,
> keeping the monitor up? It sets the bit before the first USB AP
> beacon upload. Please count beacons for both APs before running
> update_beacon.

With the patch AP2 sends. I built rtw88_core from the Ubuntu source
for the running kernel (7.0.0-43, the patch applied without offset),
replaced only that module and checked in every AP window that the
patched one was loaded. Same RTL8812AU, channel 6, monitor up on
channel 6 across both APs, 12 s per AP, beacons counted before any
update_beacon:

             AP1/AP2 beacons   0x422 before AP1/AP2   during AP1/AP2
   run 1     116/115           0x71/0x31              0x71/0x71
   run 2     115/115           0x71/0x31              0x71/0x71
   run 3     116/116           0x71/0x31              0x71/0x71
   run 4     115/116           0x71/0x31              0x71/0x71
   run 5       2/4             0x71/0x31              0x71/0x71
   control   109/109           0xea/0xea              0x71/0x71
   (monitor down)

update_beacon was never needed. All APs reported AP-ENABLED and there
were no rtw88 messages.

> C2 sent very few beacons on AP1 and again after the update, so the
> queue bit alone may not account for that run.

Agreed. Run 5 above is the same picture with the patch: the counter
saw 293 and 241 beacons from other APs in the two windows, but only
2 and 4 of ours, with bit 6 set during both APs. So far that happened
in 2 of 10 runs with the monitor up, with and without the patch, and
never with the monitor down or without a monitor vif.

If you send the patch formally, I'm happy to test it again and give a
Tested-by.

Thanks,
Martin

