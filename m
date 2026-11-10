Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794329866;
	b=DXKwJVnsDtnzhfvk2OdykkAx0LQGYCrHmIWLvFWBVyga+3KwAGJMMQChiyygaLiqeaDJ
	 4Hg7LA6xUqLdCIA6wT+GvfR+BmGrFMYe0i2MZGGrvMTBn0fyu8wxTGUUcCYqCDjGnsTDj
	 7rUBDl0QcI3eEX0nHkaSIU05hTrvxVgV/3hZp1FqtDzgxGnivnVTBtbJvsCRXr2oKgRJt
	 y4Yjo9l3odoxwKZcpPKjEh2TmakjOrWxphyWUXHKq/yJSVk9wnFyrW3743PVmXzHdbiWN
	 YpgOCVFxflTg743ijEeSrM+k/V7p2hOU1JYxuMoOcCk1ZwovINHefAxBLVF6N9HKWhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=VTWlWMablHu5rzQ/qukxe9HIggWqaOYh6XAUDKl5eCs=;
	b=Gd16ACJI3mA68ZtW8KEhxdl/MOeDfjmNOLW7QqA5NGtES964vWNbPf5kQxaPi3nHfIle
	 dZ1ywVJKnS8yJ4oIg6XbJoWX+NY6LtulNicVYiFblrPFmyUTIQJZ26K+okcYVoqxPfkzs
	 jecUCstKXeObJBta7ZKSdv9rxFToigRDt+BBL0V0tkaozVwM6WJl1z9/S393D3xJ3KMQ+
	 yunLSp/QPzDsaWB5uC0pdiV+WR02fwcStrMPrpjZcDBVCPifm5UFLcooVcG7RrHylaHi+
	 sQFy/WSYGHSxvojgJoCBmyBuLpNioCPFZ9Vgv8n7gu/OnjTGM54mChMKPCcaMOMJ9cA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zmpuDDty;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7FE606A321
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 16:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B7FE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zmpuDDty
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e9d7791b00so19777565ad.0
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 08:57:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794329865; cv=none;
        d=google.com; s=arc-20260327;
        b=ZoNTfPUd/KOC50IrTYsBcT1Rs1fDc+tb8US8zkLa6dEVZe3OdoSOOhqVGxTZ0+lxyt
         sLDkE689sGwE3HTieFvT55qxVzPhV6/ShekP8e7IShjo3J+JHauu1v7/LVi6a31ysJv4
         EOnMauZ3/BM9mDvmn+YQX5GeYrcQheck6SQAmE2J7apjgPsHP/suYXn8M6/KLTY91c6V
         clTJTGK+3FZdqu8ZWWb14aTiLeHpILH0nLPRX1YSWl72o0Ooz30Widj9P8V5k/GeIB+h
         tykOtIPKj22elg4PVVZzthLCqF7rS9W72iU1t+/WJa7MaXGimN1QYQXyARSMLKy6hxVS
         mOxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VTWlWMablHu5rzQ/qukxe9HIggWqaOYh6XAUDKl5eCs=;
        fh=tAddTNBcAZZOzMC0SmC8NMhTMIyjKJCtceUkxiykS00=;
        b=PhyywoYwcFyFQ4/x2tIPLgveIiu+qq5rTefSbIurAsTlbF3u6iG+VAJGzVIav/iigd
         GdoWyBP4QSBM2HnT+mSlWeXn34xxFI6OhuWcLCrRhesN8C0NSJLluM5tW5aGb5Y0k+1h
         hj7a5QfHLDbDvl6c18K078ULci9R6kBJGJ4Fh9PwY+LlGXG33Ge8z1hMMfudEu47HaHd
         /wFqob+3gjHXw8Ej0uC7Jo53avE3Y9iU4E36kEgZCfP2zkIFFsxTP2I9fcIFL885jFj8
         y/HDZePhOZzsTgsJ1RqgVYzc2IuPA2kUtXnNNjFFjJjgHuvVSS4F5GkEAzOd2L27p/Fb
         HyyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329865; x=1794934665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VTWlWMablHu5rzQ/qukxe9HIggWqaOYh6XAUDKl5eCs=;
        b=zmpuDDtyxc/Vqv3Uazd6fKEUQ/T9rGldzwAuWSI33tS9GnW90Cl/cKNSEXvHElkWkU
         CHv/zqOuZ/k0kcJ+lzaMGUGFVvMqUSLDGYdcVZFX82vuj1I7ByiTWQlRQsdfSeRxG7lO
         jY1aotkGq/PuxWpzhOK2RyAPkmSnw3B0gRtAuo6XcHzbDixSHYCH7vR8jgsHRzv7NqsK
         GRqcV+r3VNQT94GOF4DnQpzCr1MVLAQguC5T0IhznuJCROFaAx01JX4BdhaNBL8+PVyX
         tq9n5FZkZSEfgsE5lVFkhv1QoOqbKZse22ztAGaTASizb/TX/RYkFKzrOwNqE86mpytF
         WWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329865; x=1794934665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VTWlWMablHu5rzQ/qukxe9HIggWqaOYh6XAUDKl5eCs=;
        b=klX9o0A0FNkASRoBt8+OKR3DhWmPncObDD1dRBpnKbN66ZmXwlu7pLlTzd2A9DUdm2
         KKE0uyJoAcx8T6yrdFgVwml5fE8jnPdV9eJWNF9Ozy6k0qLL1HQVtLDBxVdRYbozqzhn
         SM5LnM5yV6Y3a+WRKVDxDZZJ4+bpiccoxTfIfyidD7fJoFBjoMPKi24M4iBKnZlo75HK
         nEyGHV4cToo27Ai1y4w6u4L+bNanGyy3d7kFLy3bFGhWp1HRpgUgRaB74JxhHYpSEvVm
         P/q8WLi3t+n3d6ra8OoVr0uevOH0sXFDCXgd1wG8kHVQI3xUTBmpu+m1/B52fmRTUad3
         skLg==
X-Gm-Message-State: APuU4Z80/rGns836N3rKS/88ggxFBhDNsBREW7LOYGIzCbVU+5Unq/vv
	ESwNvbFwqk9TnkYANkcj0igWYnvHjhFwWNw6Gj2KWb2KljwYhmQpg1nBVts7e3R45lHOQhnZNiL
	as9HnSvEBfkMlXiW3Zt8TnJ3ay47dDX2H87gc
X-Gm-Gg: AYBFou3qhPNQfgh4OJZkbs0lWXC/nlyhuTViWiLJChh+hrlu1Zzsb9eyFLaG2AcZ/H4
	oCBsXBOiqOI5xPS2qx9GWcbuXLmzUoLKWweRvN8azuEQ6O6M5iOFAg1hr6oClPKehXQT1lxlGLM
	hbBZAna/pos6C/lYQNtAAI9Mi6eQ0Td5AiiGryOKNNQef/sCwDd+Q1sA6ZLGn5+EfzX7wMue7Fr
	Ew+9r+AqzgJWmTfoXICteke2fDQzVcsI9+RcvjAoFASl6/ruVwOMCc3iQC9DHKMb5oEk5abMnU1
	iUM3nW4trrHZ4n14/emls/lVkx/nq1hPJbYjcK2asfMwxlv7tyF1gLNGe+hwlEzva0dauvXPnMl
	3AFMee1vHfWD61pxiWfRnV7wadc4MKQHAtEWMYjARaxw2Sf1KoCMNqB09FLOdDMDl7EcQm1U=
X-Received: by 2002:a17:902:d60d:b0:2ed:f9c:3e57 with SMTP id
 d9443c01a7336-2edb924bcb2mr26423005ad.50.1794329865312; Tue, 10 Nov 2026
 08:57:45 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179373696123.186829.16487382332905756046@jiri.one>
In-Reply-To: <179373696123.186829.16487382332905756046@jiri.one>
From: Ragul Balaji <ragulbaby@gmail.com>
Date: Tue, 10 Nov 2026 10:57:33 -0600
X-Gm-Features: AclHuK-b8qXPZvSoxG3S_XItubhEO90fkIqQpxQei7kBfyp7_M0N5svu-SX9l-A
Message-ID: <CAJnRr=oYTg4de2Tdq0R1WLTQpV5Z63iwtXypK4DCSKry0vOqbA@mail.gmail.com>
Subject: Re: [RFC PATCH wireless-next 12/17] wifi: bcm4323x: add the USB
 transport and firmware setup
To: =?UTF-8?B?SmnFmcOtIE7Em21lYw==?= <nemec@jiri.one>
Cc: linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 2:16=E2=80=AFPM Ji=C5=99=C3=AD N=C4=9Bmec <nemec@jir=
i.one> wrote:
>
> Hi Ragul,
>
> I have a successful short test report for an LG AN-WF100 USB adapter,
> 043e:3001 (BCM4323 family), using your 26 October RFC.
Thanks for testing!
>
> The only device-specific change was adding this USB table entry:
>
>     { USB_DEVICE(0x043e, 0x3001),
>       .driver_info =3D (kernel_ulong_t)&bcm4323_chip },
>
> The generic dual-band profile worked without LG-specific channel or
> WPS overrides. DL_GETVER returned boot ROM chip ID 0x4322, revision 1.
>
> Test environment: x86_64 Manjaro, kernel 7.3.0-rc6-1-MANJARO,
> NetworkManager/wpa_supplicant, with Wi-Fi power saving disabled.
> Firmware matched the SHA256 specified in your RFC:
> cc286a529396434a38e59382dcd46fa92a57f1cd1a38eea20d2b24dec028cf29
>
> Results:
> - Network scanning worked in both 2.4 and 5 GHz bands.
> - Association on 5 GHz channel 36, HT40, WPA3-SAE with required PMF
>   succeeded, followed by DHCP.
> - 100/100 pings to the access point; average RTT 2.810 ms.
> - HTTPS worked; a single 10 MiB download took about 1.135 seconds
>   (roughly 74 Mbit/s, just a short internet transfer).
> - Module unload/reload and reassociation succeeded, followed by
>   another 10/10 pings and successful HTTPS.
>
> The traffic tests explicitly used the Wi-Fi interface, while Ethernet
> remained connected.
>
> For this test I built the RFC driver as a standalone module, linking
> its rate helpers locally and using a private copy of the Linux BSSID
> helper, so the host mac80211/brcmutil modules were unchanged.
>
> 2.4 GHz association, suspend/resume, cold power-cycle recovery,
> AP restart recovery and long-term stability remain untested.
>
> Would you consider adding the LG USB ID with this profile?
> Thanks for your work on this driver.
Yea! We will add this to the driver in v2.
>
> Best regards,
> Ji=C5=99=C3=AD
>
