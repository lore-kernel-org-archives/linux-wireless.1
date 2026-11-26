Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679960;
	b=2W1YSR2VRgDvXjJEHTk0gcY8rnknAubFf7fSeGYacOkPDtUOxzrHIYhZ1bck0HhUabuG
	 DHWj5w1wYDNgXaWTA7OLteXOnvbUBRS8whEu9xECccccBn661tS45pNr1nwo/F4hnWak3
	 6K4KSgV6BeLNFsFfYINYIpHHeNybikHCxahVznKO7d7zZBMHz4rpDGaaZ0HeRIStg9tvK
	 5rv3xpV0WQxUWsuEu2wPDy3Q4BjFJwRFal7bHP0AqH6Z5WNyqapm67e2Got4Fc1CLKStX
	 BGlusk3uwdH122B9axzyjEP9IDtP/PRqxhlVVhaGXXutOPfhFsMN3FGejSrFYGpcvGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679960;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=cCMXw64D3KmB/4XdPczfsKjvi9Eby0MgDnsPA/DYAYg=;
	b=mSJoKrLWdsHETHkGJuFLUVmJ79A0SoAg+uOkj0+GUKvAmEjhPKK9dCPaz+x46qPN4rn+
	 08KYJSK6tO3KV8sXUQpw5s85/2QVUU89P0SqNqkUutRzESyIYCNGKPcFE4GqjIBR6+m6M
	 I4V+aaRMM8tP3OBlw2cn4CtFa2jAUYQXB/0cMD7r1rvXeMLSSVcDP9cT6onJMYFGgLqQ3
	 oQE4EMxcJl8BwmyisOmaNgNjOj6FziWyhj/FtblMmTTHmLS8/Ssr/C3zEeAXrrnU4sYCJ
	 sEJ1d/9JA04mvW1sRwHznGW/a9FZtfdm0pCIk3vui8ozu6Q3XqodRa1kkWPvjSysz0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Mt8iR+yN;
	arc=none smtp.remote-ip=91.218.175.65
Received: from mta0.migadu.com (out-65.mta0.migadu.com [91.218.175.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303D3606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 07:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 303D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Mt8iR+yN
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Sy0d+YvUzcd8XpDcoIFJf1+YvpvtJDxpCOlBqCxDqGs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795679957; v=1; x=1796284757;
 b=Mt8iR+yNodK6cQbuKUkX1TqrYbbXmJZU/6416n2aigDPTxsElb6W6B94l/7ou2876QRb9ZkO
 oL8dZB9pcUB/omjZTiY6qJNgLk3Ac1h2izGnEDgdvBxilkN9XevO6gt64JvenMAYJETSEVT+CB3
 tuk+RBzAZEjEYjTPByPcM7jg=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 846590ccfcea3b4e;
	Thu, 26 Nov 2026 07:59:17 +0000
X-Mizu-Trace-ID: 846590ccfcea3b4e
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 26 Nov 2026 07:59:17 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <a0827be820914280cca81b32b495cda655a87fb4@linux.dev>
TLS-Required: No
Subject: Re: wifi: rtw88: usb: AP sends no beacons after monitor capture on
 the same phy
To: martin@rfdeck.de
Cc: linux-wireless@vger.kernel.org, "Ping-Ke Shih" <pkshih@realtek.com>,
 martin@rfdeck.de
In-Reply-To: <20261126081256.Horde.ilxldEFeRo6UQJajd_7Nd6S@mail.your-server.de>
References: <20261124144427.Horde.qQ_UTCx-6LmjjeS1bojTj8-@mail.your-server.de>
 <D34D5E6B-B159-4F34-92D8-4264024D3319@linux.dev>
 <20261126081256.Horde.ilxldEFeRo6UQJajd_7Nd6S@mail.your-server.de>

Hi Martin,

Thanks for running both tests. Two followups below.

On November 26, 2026 8:12:56 AM GMT+01:00, <martin@rfdeck.de> wrote:

>    A, monitor left UP:       116/0, 116/0, 115/0

Could you try the two AP starts you suggested with just iw? Set the
monitor to channel 6 once and leave it up across both runs. Please keep
the same waits before the AP starts and count beacons for both. That
would show whether the second AP can go silent without channel hopping.

[ ... ]

> Read 5 s after hostapd started. All 12 APs, sending or silent, gave
> the same values:

The beacon queue bit is set in both cases and the timer is moving. The
driver clears that bit when AP1 stops and sets it again after attempting
the beacon upload for AP2. Could you read one byte at 0x422 with read_reg
just before each hostapd start, while the monitor is up? Bit 6 is the
queue bit.

The next time AP2 goes silent, could you leave it running and try this
with the hostapd control socket enabled? Use your AP interface for wlanX.

	hostapd_cli -i wlanX update_beacon

Please let me know what the command returns and whether beacons come
back. This asks the driver to upload the beacon again on the running AP.

Best regards,
Luka Gejak
