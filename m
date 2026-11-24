Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795564727;
	b=P4C78YMd5vy7lMU5aCRL5WHLr0a2eq3C0g0KLF1bWRPMk3eyNhPHX05w5EI43GXws6+u
	 IXkf87lsmofiVsAxkzriaU1yYqNvVwVqW1PowkeFMo/Y40IxGSAVak19ZMxilP2RfuApx
	 6lx/XCZvmlIKqcAQeUGKoopGEiGbi+REXQOmh9VqKKpOQXGKPZTxlyDxfyiJcDPMDaNqX
	 7QEDrzO0IJMI720rAnshsRVXiwnPa80FWLYTrTDhsxdx62ycW0xdcZBAVb1HwV2N+Eu6m
	 nW6luFDSQQsTTQz0lUYD/IViCexJoqEFFYNblCO2DtfSPWZnH9zcgfmMIGGbmKSCa5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795564727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=Oqlm3u5ZbkqMiDJr0EO2PMyP2oXWC5az9LL2EEl4wLQ=;
	b=or52wTgkykim9dgyqZxB2Wk72yuJx4wXhPgzBxQAdwpktNO3G5MlZvnN/+Oi4sx4gGtQ
	 5eSBDldvxlOCbm1wq/hxE+9skfEvsYU/KO0oe9MYAe/tS6Af9pRo/X/v26i2hDedoR+F7
	 2oajfC4VCrVWjdmb2UJYaENPmz5xuc2lfwyy0uRCByA+h0UouzDcUCxMeTSt1c9jXsirx
	 YgyRcye0GBY7Ux1a5TQqPu3R2J5OmNhi/jW2bwHya86ZS3+82oudTa2CyMBJrZLRwGQjQ
	 SFO+BR4HcnD5dtW5zVerw5vSqDO1SIAQkonoLgiP9ILZZDUW/fi8D1p1j2XrqNXM5QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m11HrJY8;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5855C606A321
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 23:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5855C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m11HrJY8
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-921318b2eb8so66634906d6.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 15:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795564726; x=1796169526; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Oqlm3u5ZbkqMiDJr0EO2PMyP2oXWC5az9LL2EEl4wLQ=;
        b=m11HrJY8hYAgwaVFCOzPinshU65jlcbTf2oAsKN1YFaEoQ7Op5Hw7kwn6IjkOFZmyk
         HfgZho6puI4jrWhZbmwDIMUzprLMMxWbUSqMWyHKc4fZC4XxEMXVQRvxdhJg+sdioOhk
         kN0Qc2qcYZfHkN9Xv7443PNScDruJjZeYgSE9vsCubheDcFtFDNbGVM81OBlCzIL/mtW
         HZkPB21y8XjYnCURv/bCbPXrfT51AZYaFSIYGhJr3K9+V+k7orQLauHp3XzB5Xm9FqrR
         fliaNuIn7+bkHlTsiBuNanpVixl82jykxUQE9QIMUz3nPhfmiNXOVjL8oPo7OmjI79AS
         iHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795564726; x=1796169526;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oqlm3u5ZbkqMiDJr0EO2PMyP2oXWC5az9LL2EEl4wLQ=;
        b=I2Oi2vyCVPC2mYACrzX2G+KoQMbu5Eqg3PAv5Sn8JnvZ9zsKEK0BB1Lz0OFoOZGzPx
         LWjKDe16yH8ltN4N8kEVN6wbOM9GhD27WHr+bhtE+Bit+9ub76Tr/M9KZ0cpN96J6bch
         HEDJVJEf231lk/P1d+4gMAFYnaoEuBYs+An27rSGoOyyOPU50hwDqyX4fBOe6ARDl2b+
         elfQl72E7M7y5Cw16ZM/jn0zvEdB7Pov+caDiv9CCGRtyVa89oB1sYgY8AE4XxW40FiV
         uVYpKYTtVcdrCtgaU2MiM+iPDwOBMNXLuJo768ffFqpHtA/rQWeOSVXf8y/RxruXWRyC
         P+Sg==
X-Forwarded-Encrypted: i=1; AL+hErGrVws5eACBjRs2/x7Ogac1XaC0ufgHcEahC8v3+F1MxhmuuikMAL8/5uDc4z02oDxweay90rKA/PYzQwbLtg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/gNAR3kVAlm4BfGUPrgThcCKdymA4IgmcSFxlyt2etvVRpVlvf
	oAgW3fNGsktvIEOdNdyBrC1C+q60qvcG8heB+OxKE5DZbsRCdAQhZt0dDOVD0A==
X-Gm-Gg: AZFdTZey7kA5EQgOF3H8iLtETvosl+jK5g4cALduLwB6Q2iT1zn0FHjvf1GOAWBhIBy
	fgLyDuEb/fbJU44F4fioGBCk+7NI33TYEQrZtHaLrCJ8Hz7cn/14rDwzB8Re9ZdrK3qKI4p94Rl
	V3pTx/5Pk2IaeMpfzS3AfG6F7qMOIveVdNP5BZC6/Xqd6EIIZ5pQNrIMUwn4pozIiP6jCZoORUp
	zbOPfYjjWjFasIOhnca6Z93wqRf22UpyVYGw43ncI1slYGivW81l/5PRtXYsZo5KTH66LRFexM3
	39aKpwpxWPnlLpeyfFrCmemvj9uYNw/VObjPANMo0Wp9vFmK6CTwUJ9xXildHbMMB32c2AxCWyi
	LASBU/zyYt4NyAK523xN0Af5BWuWZ0/J4/KzK2n8UtTilxZ5GY1/h7K6dU0iS/jwv3jOMkz7J6Z
	92sw1tF/+rVjJpXneUZcRRjhW8hLic//02tBH9XGS3f6hhcJDDRxpDXndjITlB6BpceFuFl0gnj
	zkoTyxbppqXTCTStq8PwGyA1qPRuskj9VXjPN6sX33enGJ6Od6KBtMD6MPE25ECEaoMPnt7Zyn4
	3lS4UAGx5lIIgVICNJKjqSvZDsvPzFrt4oNiKGl9jixF6/5xJFkVU5wE
X-Received: by 2002:a05:6214:490:b0:921:346e:3b56 with SMTP id 6a1803df08f44-92134a5549dmr300975996d6.21.1795564726234;
        Tue, 24 Nov 2026 15:58:46 -0800 (PST)
Received: from smtpclient.apple ([2600:4041:44c7:5c10:4c64:9917:f087:f946])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349ec64csm148737526d6.28.2026.11.24.15.58.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 15:58:45 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH wireless RESEND] wifi: mac80211: apply ap_isolate to
 AP_VLAN stations
From: Christopher Hill <ch6574@gmail.com>
In-Reply-To: <a915638f7d6a4a1fbf5b510743ceac8f88cd8a18.camel@sipsolutions.net>
Date: Tue, 24 Nov 2026 18:58:35 -0500
Cc: =?utf-8?Q?Miroslav_R=C3=BDzek?= <miroslav.ryzek@gmail.com>,
 linux-wireless@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <E0FB2764-EE62-4DA5-8136-77F15EC22D11@gmail.com>
References: <20261120235359.3424212-1-miroslav.ryzek@gmail.com>
 <a915638f7d6a4a1fbf5b510743ceac8f88cd8a18.camel@sipsolutions.net>
To: Johannes Berg <johannes@sipsolutions.net>
X-Mailer: Apple Mail (2.3901.200.71.1.16)


> On Nov 24, 2026, at 09:16, Johannes Berg <johannes@sipsolutions.net> wrote:
> 
> Why would we want to not have this separated per interface?

Hi Johannes,

I made it BSS-wide because that is all userspace can express today:
nl80211 only accepts SET_BSS (and so ap_isolate) on AP and P2P GO
interfaces, ieee80211_change_bss() needs the AP's beacon, and hostapd
sets ap_isolate once per BSS. An AP_VLAN can't get a value of its own,
so a per-VLAN flag would only be a copy of the AP's value. Note that
multicast_to_unicast is handled the same way.

I can read "per interface" two ways, so here is roughly what each would
cost: 

1. Keep the flag in each sdata, and have an AP_VLAN take the AP's value
   when it is opened and when ap_isolate changes, like control_port_*
   in ieee80211_do_open(). Nothing changes for userspace, and debugfs
   flags keeps showing it per interface. I have this as a prototype:
   12 lines of change in cfg.c and iface.c. It builds, but I have not
   run it on real hardware yet (I would test it before sending a v2).

2. Let userspace set it per AP_VLAN. In the kernel that means allowing
   SET_BSS(ap_isolate) on an AP_VLAN in nl80211, an AP_VLAN path in
   ieee80211_change_bss(), and a rule for whether a later change on the
   AP overrides a VLAN's own value: about 40-60 lines. hostapd would
   also have to configure and apply it per VLAN (roughly 100-200 lines,
   a new VLAN file option, and a fallback for kernels without it), so it
   would only help once both are released.

I would send 1 as a v2, since it fixes the bug without touching any
UAPI, and treat 2 as a separate series if you want it. Which one did
you have in mind?

Thanks,
Chris
