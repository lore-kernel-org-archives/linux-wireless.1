Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.60
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937877;
	b=dJP4198Vu531QgVjMte8P9cwl6P+9cbecoMw9O6CXca02iofLekeSUxYUhEALP9ly2lO
	 nWKPRFPWUWfDGI0IGsIi+YCEkYvugH8dkDyKUCzfueS2lmG0BEUg0sXF9LgYHAH2jzPcO
	 E2SkV1u/MW6RuI3h3VrZg5XR1sHeAHBBekxnKfaT9MWt85ncCcxFyw+fEuq8pY/RYXHmL
	 WF+0tK+xYgGrplAaf6a5Y+TNByboao5F9V34ifE1FFDz4MN6ONV6ZMWJwoBaKa8/fXjPI
	 4FIiMO+7rB1N/n+QFDmZOI7D0shp6ERZS9tsPNnmK5aA+1Gb32Pjp0y+5vm94WjXbUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937877;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Content-Transfer-Encoding:
	 From:Mime-Version:Subject:Date:Message-Id:References:Cc:In-Reply-To:
	 To:X-Mailer;
	bh=NyJHQVZlR7Bg3YiZaxy69rT5ur8XKMGpnCK8SptUJGI=;
	b=sJ7XyfuRFDyjg71WkK5mUwOrHUa+JzD2nKguuOTGblYGci4G6wOP75Udt+Ufo53N+Kt/
	 Kkg2YQSwS1i/1lQpJ631Bc1nzQYnuxSWZKYqdOQ414BgsmvFHAMaR9M06ZL75BRA/d2lm
	 7yJbezLXDCKYfzNTmwzCvrD5TKja8MeiNFtdfN6gA4C58twqmX1J+3NEJSbIUksJ2KeIW
	 AzWNqhtrlsmr0eapQ3U6x2+25AMnUgav5kMt9HFjAuEVbbaOboUIJR+Bzri+dEbabe/Zv
	 UilFC/VJjRCJ/JIU6gbUotWwusMfiGvKu9i14R9fVSqd0Zj4wnUeVGw2iF5Wf64b2zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aCtsCo7m;
	arc=none smtp.remote-ip=95.215.58.60
Received: from mta1.migadu.com (out-60.mta1.migadu.com [95.215.58.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA84606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 17:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BA84606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aCtsCo7m
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1TRKjL14fn5CF/4hY/IYYIPiXO27UBjCdYR27fESFKQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794937874; v=1; x=1795542674;
 b=aCtsCo7mqdM7j4sJT5J1OZSfgoNddETO+FcomH42zirVfyw/fwvtFrNALO5lBJkEjfPgnxCa
 yXncYrk+JJjXw7TYXOIgw/S5YVMQLEUXOv45yMBABIKC0q1dEcbZrLMgAf4PerwGGxNWfHA6pCk
 HmbSfA2sb9sIzTaHFrhFAiEo=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 4153e0931e20c31d;
	Tue, 17 Nov 2026 17:51:14 +0000
X-Mizu-Trace-ID: 4153e0931e20c31d
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Aditya Garg <aditya.garg@linux.dev>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] wifi: brcmfmac: disable TX beamforming on BCM4364
Date: Tue, 17 Nov 2026 23:20:56 +0530
Message-Id: <2FBC4AA9-16FE-4710-B43D-9004B0B17DFA@linux.dev>
References: <20261116203719.281605-2-arend.vanspriel@broadcom.com>
Cc: Andre Eikmeyer <dev@deq.rocks>, arend.vanspriel@broadcom.com,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 Yossef Osman <Yossef.Osman@proton.me>
In-Reply-To: <20261116203719.281605-2-arend.vanspriel@broadcom.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
X-Mailer: iPad Mail (24B119)



> On 17 Nov 2026, at 2:07=E2=80=AFAM, Arend van Spriel <arend.vanspriel@broa=
dcom.com> wrote:
>=20
> =EF=BB=BFOn Wed, 4 Nov 2026 16:16:23 +0100, Andre Eikmeyer <dev@deq.rocks>=
 wrote:
>> With "txbf" enabled, the BCM4364 firmware (9.30.514.0.32.5.94, as shipped=

>> by Apple for the MacBookPro15,1) transmits a single beamformed spatial
>> stream (nrate VHT MCS9 NSS1 TXBF) towards a two stream AP. With "txbf"
>> cleared it picks two streams (VHT MCS9 NSS2) on its own. The firmware
>> enables "txbf" by default, so the driver has to clear it.
>>=20
>> [...]
>>=20
>> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
>> Tested-by: Aditya Garg <aditya.garg@linux.dev>
>> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
>=20
> [...]
>=20
>> @@ -450,8 +451,12 @@ int brcmf_c_preinit_dcmds(struct brcmf_if *ifp)
>>        goto done;
>>    }
>>=20
>> -    /* Enable tx beamforming, errors can be ignored (not supported) */
>> -    (void)brcmf_fil_iovar_int_set(ifp, "txbf", 1);
>> +    /* Enable tx beamforming, errors can be ignored (not supported).
>> +     * BCM4364 firmware enables it by default and then transmits a singl=
e
>> +     * beamformed stream instead of two, halving its uplink throughput.
>> +     */
>> +    (void)brcmf_fil_iovar_int_set(ifp, "txbf",
>> +                      drvr->bus_if->chip !=3D BRCM_CC_4364_CHIP_ID);
>> done:
>>    return err;
>> }
>=20
> The chip ID check has the same problem as in the ARP/ND offload patch [1]:=

> the issue is described as specific to the firmware shipped by Apple
> (9.30.514.0.32.5.94), but the quirk applies to every BCM4364. Please
> restrict it as suggested there.
>=20
> Also, the comment says "Enable tx beamforming" while the code now
> conditionally disables it. Please make the code self-explanatory, e.g. a
> local variable or an explicit if (chip =3D=3D BRCM_CC_4364_CHIP_ID) with t=
he
> txbf value spelled out, instead of passing a bool expression as the
> iovar value.
>=20
> Minor: typo "refression" in the commit message, and the subject lacks
> the target tree (wireless-next) which wifibot flagged.
>=20
> Since this is a throughput quirk (not a fix) I would also like to know
> whether TX beamforming is functional at all on the BCM4364 or just
> mis-selected by rate control, so the commit message can state the actual
> root cause.

Unrelated but Airdrop conversation seems to have been stalled :(.=
