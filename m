Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.243
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795644634;
	b=TFCfz4+D7oRKpF9AyB3nYao2gqaj6JnV0nqCvC8R+ASxYObwMaGubLsPhiuROKdqXc88
	 zqRUfW/NuYCeJChUevZq7yPJFUp14wqBdp1uurhe3LsYbUVIJNpF5iu7UKZ3o+eGMkRk7
	 WtBBaOJ8AjBpjW9cjn3VsDUTlTfJH8uIZnKyHVNdS7c83mqK4r6xAej7fV+uYxpFLlzcU
	 M6mHujOwa6wQDblF+sNFrSPZEm390A6w2CaMXEiL0OAXlRt4TwIOCSHguIaGNW2GEehul
	 Ck6ZU2fouOhhLbSZOQRLJplDE1CmmLEFIcu4xujclPjd4MZ2YBmjOMV+N6111ZtydEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644634;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7X7eZ8g89aWvyU5IsvyoHBmGTrF1v2G1NnfsOXDoh/s=;
	b=h7JilpJe9Z8Is3qHjFhax/4b4OyTwrL/xn/D9auvqS3JrucptvmYu2gxXj1LOJDuEnEK
	 riOaRlQDSGGrkpJyOYr3f3DJajt3WeAnsmeXLW79JYTjgVBZXFXkTfd4r4hUwFXzROxlY
	 DKdybgXS/Hf1y1ubyh5iv+6f6ncX0k5FOP4YD9lni9uUBNAYuLCDeU1WKp3IxarpUT2Ct
	 BPr+AuW7ExfLQnYE8QUCNM7s/z8dmQ2uAhnbxE+4QbdtYm+Q5Hm7sG006gp7ewKbzOi0D
	 e9NTUONul/ugl5CgTVpOQ7RB8KQqrl+uIWvR4UR69mhaV7un9y1movMdCsqjTrqdKIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VcdkhjHb;
	arc=none smtp.remote-ip=91.218.175.243
Received: from mta0.migadu.com (out-243.mta0.migadu.com [91.218.175.243])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D2B606A327
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 22:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D2B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VcdkhjHb
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7X7eZ8g89aWvyU5IsvyoHBmGTrF1v2G1NnfsOXDoh/s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795644631; v=1; x=1796249431;
 b=VcdkhjHbs/4XVsxm3CrprU+WD6XI0wbsDsUXV4+1NnWbIOAPpJaF752fmsoM3LUwxl95RtWY
 R3+rVBW1jpgt+kenDV8ajq5rPkrVcW7zCQFJgGOAPelrjtAloLyqoue0UsFPC0jKSuZjsvsZnEX
 ZzEGo4ObtS8fHLn8Vaz9zWlw=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2be0549c1c4b62c6;
	Wed, 25 Nov 2026 22:10:30 +0000
X-Mizu-Trace-ID: 2be0549c1c4b62c6
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 23:10:30 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: =?ISO-8859-1?Q?Pablo_Mart=EDnez_R=EDos?= <pabloriosmartinez@gmail.com>
CC: linux-wireless@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>,
 Ping-Ke Shih <pkshih@realtek.com>
Subject: =?US-ASCII?Q?Re=3A_rtw88=3A_RTL8822BE_=2810ec=3Ab822=29_n?=
 =?US-ASCII?Q?ever_authenticates_on_5_GHz_with_a_?=
 =?US-ASCII?Q?Huawei_router=3B_poor_2=2E4_GHz_link=3B_?=
 =?US-ASCII?Q?same_hardware_works_fine_on_Windows?=
In-Reply-To: <CALTviDnvzt5bCti+0x0bqNBfDwBKRRUog8QtrBgeS9DnnbDu5Q@mail.gmail.com>
References: <CALTviDkEWERPrtc51WFB1K3Sn7wLdt6YhB=_Ck4PwBPdLcojBQ@mail.gmail.com> <2c8319def838488cb8a3e4d5dc44f357@realtek.com> <7d68ebe2-d24e-4c07-9b49-7f76551a12bb@gmail.com> <CALTviDn=ypR2HCjVxu7U-5RDRU002YNxCbPqeH7a+5LTNxCNbg@mail.gmail.com> <36da0b32-9f97-4e82-a06e-53dcd42125dd@gmail.com> <CALTviDksF1-AoDXUDpyH0eQLbtrMBJ+DsnSuKGm=3W1E3q_O7w@mail.gmail.com> <8f5486b8-9bcd-4c6c-b0ab-500bb80ebf00@gmail.com> <3E4C2E08-4DB8-4017-954D-C2412CEB171A@linux.dev> <CALTviDnvzt5bCti+0x0bqNBfDwBKRRUog8QtrBgeS9DnnbDu5Q@mail.gmail.com>
Message-ID: <E271B0DA-1A99-4BC0-A227-5BDE48C52356@linux.dev>
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

Hi Pablo,

Thanks for running these tests. I have a few comments.

On November 24, 2026 6:20:01 PM GMT+01:00, Pablo Martínez Ríos
<pabloriosmartinez@gmail.com> wrote:

> patched modules, ES, twice: no connection

With the same failure under 00 and with the patch under ES, I think we
can set aside my ETSI threshold hypothesis. The edcca_enable switch puts
the 8822B back in normal EDCCA mode, so it still has an energy threshold.

[ ... ]

> mac80211 configures the full 80 MHz
> channel already for the authentication?

Yes. mac80211 sets the channel from the BSS before sending auth. rtw88
uses a legacy OFDM rate and sets DATA_BW to 20 MHz for the auth frame.
It sets the primary 20 MHz position in REG_DATA_SC and leaves DATA_SC
in the descriptor at zero. The old staging driver filled in that field
too. The vendor driver for the same PCI chip leaves it at zero for
ordinary management frames.

Ping-Ke, do you know if the 8822BE takes the primary position from
REG_DATA_SC when DATA_SC is zero for a legacy frame?

[ ... ]

> set to 20 MHz, logging the radio's bandwidth.

I'd start with that. Could you keep primary channel 36, confirm CH=36
and BW=0 during station auth, then switch the router back to 80 MHz and
repeat from the same spot? The 10 ms retries fit the path where rtw88
reports a TX failure and mac80211 retries without waiting for a reply.

If you have a second adapter, a capture near the router at 20 MHz on
channel 36 with control frames enabled would help. Can it see the auth
request, the router's ACK and the auth response during a failed attempt?
Also, were the injection ACK counts from captured frames or TX status?

Best regards,
Luka Gejak
