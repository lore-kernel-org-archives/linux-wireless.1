Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794540102;
	b=yKiO/qORd3idwModG81OJgQNLUDL9nj2Ac5f3AQ+mSbR9ALBREI9p1SRW7F9t9zBUULC
	 o0YygxpJNfkup6Ho5DiBQpWvYSqT0KGPKCKDjOVqctHR0+mbyT+mOoKPDmzMwO/KUuD7v
	 E+nENxCYUxlY4OcsriIzUdpqMCcfAVBvLJlPd5oiCmlUnt7VPnVOkMamc5vDAMo70d+Fp
	 UK8jytMuSYWV8yzrVLqXyUPUFdKS8Ynzs6V8lydAqfDyzYwd06Xko5hoziT+2CvNdgkhz
	 ICV5SZd1ARpNqaey0dcKOZRppcQpiishkjB/692yN0NDxc+xn1u/iNaI3OMWaGhUWJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=KlC7kz5Wd2GugrQzeadNEBgbSiUKxvLtosrmHbuGMxk=;
	b=mLM3ychQZdMUwIQ1re9kd4Q36fXR9E4XCTum1U0kQYKVBfg5gnZuNe5zJHr+vnFnJYgK
	 8qbDgVSxeVBpfBqVRMmmdqnr+j2j+wSBUgLhPytap5xm9eqZrEs47b+gcEZbMxZbmCRlG
	 pJQAImZVQcp6Dy12FDeYJdpYZohwy+pTBPPVY9+MIGRfZ9P4fv+yZzks4nTlhiQs+T0Km
	 gsM8ieJOg0zQclDRaZadN1vwSAlKKVaoiP6N7vUTyO+Kl/NJuxb6vvgjK/8xmoDJzL1Rz
	 rGE/YsrZEy/oDjNg47MR0GKSEEM+Pd8wkj/Aa3qsBptrfF1HcKi280OWJkEbrB4P47g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p+yKKFSE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50A8606A321
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 03:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B50A8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p+yKKFSE
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7d2ccd3c7a2so137597137.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 19:21:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794540101; cv=none;
        d=google.com; s=arc-20260327;
        b=iXGMrLgfpgsj8AAnHg90Iq39NW+Ht7BgI1LtwSMq/hG9qIInXjUg9QLXqAeVpmnAC/
         6aQFGERlrLVqRTYDv/PgkLfRlJIW9AtCQ8unLmve5tEykDKYCpzs5Hp5zHltcC5xA8k4
         H0g9AJI4e9ucZqfI2emsxqzV0Zlhkr/lDvfq/HHfQV4TUlCefBm7I5kjFDyr0mcBo2c+
         FelPrPTMsthhVwHPmE4PP/ndUmUXNyRj3ZYYGfjrmkiJiKMuLqouxR5kT9jxZcf4l154
         ViV9/g0aSo+mfi/j2ligUbZCL41DlJSwPZ9za8wtIGrruSmj8Me0xYgQcDg+g8+6NqIh
         gjKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=KlC7kz5Wd2GugrQzeadNEBgbSiUKxvLtosrmHbuGMxk=;
        fh=L18FZfmKXX4RlTQTKWM+rDsRzvCtr0QcJx9IRDcjCnA=;
        b=F9ozG/Px0iLlYTl+iRb4FbcvPoOuGaChAWuJO+IEDEaqJLDD+HHa1HifMTHiLuEdlI
         rxuw4GO4JxJwXWAp49DRGOle/a3bTOv0Iy3/90ioOx7576M8Nb9dZi73Ud25KSLB3a4Q
         jXxJ6m6N/psFIPm24yyG/ERWmBk5iuH89IroFW7kEa2KDVPkvtdxphVWKO7kbBqlBMTz
         ZnlofDZiJihUyxGPSjKCWePFqqBHbEcs/aGBC+Ip6gZz6BqorGtUcRHJ3mZfA4OeC1ns
         msJ6fIEcpRV3W0VDZCShVaL2RV63aRpr0lcbCoTa0cqck1MEUhs+qA5FLBiJzjigzRyE
         YClg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794540101; x=1795144901; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KlC7kz5Wd2GugrQzeadNEBgbSiUKxvLtosrmHbuGMxk=;
        b=p+yKKFSEqRUjbz47fBwoJzJkS4+jhIUzdjZZZSJ0azUfzJBRj5DHk0RgEvku/oYJxo
         XxcqzyLF3WMhME6fBoDP+MsSVr/fV3oX3jJQBy0FwS5rOXOZYhgJIKxrjh4O7jZS/MOd
         HPhv3+N//W02rVjqCkp5DD6PWaKm6pkVcOTmBgAs69qYezPxCuC5P1udn2MiPjTn5Hox
         rmmWjAXCjA1y1up4AQwQHY054NrxA1WZB1Fp+fNZ34v0JSv2b/oIxvcrB/mI4ckheFe7
         xrqFDzO/PFUEbh8XoMu5qiIHHdWIzrAOWm9eqUUWS1LHGyzjjqF4gHwTi+XgzArqUMXF
         kRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540101; x=1795144901;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KlC7kz5Wd2GugrQzeadNEBgbSiUKxvLtosrmHbuGMxk=;
        b=FSVmnbyF5VuUpJlgXcI9cix5v4Jzs8aD03E3K5B454Qux6biQ0w6LXjAozTcE+xWJK
         rPEaW0g/xA5WGFU4pXh/H+CRhBkwgrcUa8/9TXDbuPoKI0Enxvu112lD+UPuPlfnW6EJ
         RIkU0mZaYvyUpAF1cYampE+1lE4pwtR/TMTY+sVf+ejLsG/e1ULrecy1uyCu6wD6jYSi
         MLSAa7wfahDps67LPEBDOw5NyIC6MpQHbwm/abPz2v4d+u0pbX0N5w4KHkyNx0U9Z1Uy
         iIXaewLiTtQpQ28O9IihKHd9OffbAPqoaupITqM2yY+ax1R1keixe7SODpLZnNMAXlzP
         dSlA==
X-Forwarded-Encrypted: i=1; AL+hErFbfbhg4BlFTG2vIZSQCBisHFmcSUGbTq1v14ENhSl6MngJ49FGwBbXgSaYxr6elOUt+dqvmDqvefbYdbSqSg==@vger.kernel.org
X-Gm-Message-State: APuU4Z++RvB/MsUW+vCyaXR+JDkCHXQktAyxt7yLyvN4bQL4rTxnPyeF
	cvfLU4mtCcu/OvNZ/xmHx9b7yC0CKQb1cyNGn/G0HTmPkjaA03xR1blI0d5bCs0jRm0m9L4hBA3
	cGtUt8dw4WhGa4kdfswI8VcSYM0zBZ7Y=
X-Gm-Gg: AYBFou2wt+5K+v2q5MbksvWP+SPhedFBurdDdMNU64vk+Ii3UWqIrbYslsP30UlCcNx
	LSpm8DWfjLb858folMI30yD0oHVs9v0y19vbf/7/Isi70RaxGiO/W0HCgF9A14/EwNM/Yj9+Z2N
	qgbLCZ3r1iclIeXtBjjz4rw7o1rqK+snutiDvB9DQdoHefNXlYI0Ce6njtpf+9NhuaVV3QUWp0h
	rlzJvpw6nn9Yqslpq7LsML58EjItpZGdRPlP8cdpj2o1ITO94Nsd7lBUXSJRiPvcSu3otVx7Ldv
	2kS4l4uKdts1F4mUv0JC6N39i2st9vLp0ChrDYL+XElu163uFj3UtC0mJdKF6xqwMBMd8x/fZiw
	esYyYgZrlgwfloF55Ob9Uny1wQu5LzC9yMNh3
X-Received: by 2002:a05:6102:c86:b0:7cc:2daa:90ee with SMTP id
 ada2fe7eead31-7d64d74eefemr361865137.15.1794540100262; Thu, 12 Nov 2026
 19:21:40 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 12 Nov 2026 19:21:39 -0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: enderaoelyther@gmail.com
In-Reply-To: <27d2c98928859d47b2c3cf76870d868882685809.camel@sipsolutions.net>
References: <20261028141751.6728-1-enderaoelyther@gmail.com>
		 <20261028141751.6728-3-enderaoelyther@gmail.com>		 (sfid-20261028_151822_083722_A5EF7A18)
 <76bc126fb977cac0f0a124fc80eae9fdb803264d.camel@sipsolutions.net>
	 <CACHPgzw-JeorCAX-b5jjd6d5=L0oYpPdGtstUSaz5sPKZE2HsQ@mail.gmail.com>
	 (sfid-20261111_204546_211086_1FE84B1B) <27d2c98928859d47b2c3cf76870d868882685809.camel@sipsolutions.net>
Date: Thu, 12 Nov 2026 19:21:39 -0800
X-Gm-Features: AclHuK80WoaUMO0xvfMrBMj1IE6hAop1teGb0zcH15s2lA-M5re3Tk-IE5T-ugg
Message-ID: <CACHPgzyGx7trDo1+j_HKCNaQn8K9ZE_nxDX5ZxDfx=U3kxTAdg@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: mac80211_hwsim: serialize radio removal with
 frame commands
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "John W. Linville" <linville@tuxdriver.com>, Javier Lopez <jlopex@gmail.com>, 
	Jukka Rissanen <jukka.rissanen@linux.intel.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> hwsim_tx_info_frame_received_nl() just doesn't do anything that sleeps,
> so it could just use RCU protection directly?

Agreed, and the same applies to the inner transmitter lookup (txdata) in
hwsim_cloned_frame_received_nl(). Extending rcu_read_lock() across the
full use works there, since teardown unpublishes the radio before
ieee80211_unregister_hw() and wiphy_unregister() unconditionally runs
synchronize_rcu() before ieee80211_free_hw().

> hwsim_cloned_frame_received_nl() uses it twice - the inner use is not an
> issue as above, and the outer one is just acquiring the mutex for
> synchronization with ->started, but given that mac80211 will sync RCU in
> stop that's perhaps just not needed at all? Or maybe hwsim just needs to
> synchronize_net() on stop.

The existing mac80211 grace period is too early to replace the mutex
during an ordinary stop. It runs in ieee80211_do_stop() before
drv_stop() invokes mac80211_hwsim_stop(). Since the hwsim radio remains
published, a new reader can start after that grace period, observe
->started as true, and then be delayed until after the driver has
stopped. That is the window the current data->mutex closes.

Setting ->started to false and then calling synchronize_net() in
mac80211_hwsim_stop() could replace that mutex. That would be a
different synchronization protocol, with the grace-period cost moved to
every radio stop instead of keeping the existing per-radio exclusion.

> hwsim_pmsr_report_nl() uses the mutex for pmsr_request access/swap and
> GFP_KERNEL, but both of those could change? might need some more work
> for abort though, not sure.

The abort ordering is the difficult part. cfg80211 moves the request out
of its list, calls the driver's abort callback, and frees the request as
soon as that callback returns. The existing data->mutex therefore does
more than protect the pointer swap: it prevents abort from returning
while the report path is still using the request.

Changing the allocation flags or atomically clearing pmsr_request would
not provide that exclusion. Abort could observe the cleared pointer,
return, and let cfg80211 free the request while the report path was
still using its local copy. Avoiding the mutex would require a new
request-ownership protocol that abort also waits for.

So I agree that direct RCU can cover the two non-sleeping lookup uses,
and it could cover the outer cloned-frame use with the stop change
above. It does not cover the PMSR path without redesigning the request
lifetime.

A hybrid design is possible in principle: use RCU for the frame and
TX-status paths and retain a per-radio pin for PMSR. The reference
version instead keeps one lookup-lifetime rule and leaves both the
existing stop synchronization and PMSR ownership protocol unchanged.
Its trade-off is the short hwsim_radio_lock critical section and the
reference operations on every lookup.

I still think the single reference-based rule is the smaller and less
fragile change overall, but I agree the RCU approach avoids that
lookup-side cost on the packet paths.

Thanks,
Zhao

On Wed, 11 Nov 2026 21:34:12 +0100, Johannes Berg
<johannes@sipsolutions.net> wrote:
> On Wed, 2026-11-11 at 14:45 -0500, enderaoelyther@gmail.com wrote:
> >
> >
> > The underlying problem is per-radio object lifetime, not command
> > serialization. get_hwsim_data_ref_from_addr() returns a radio pointer
> > after rhashtable_lookup_fast() has already ended its RCU read-side
> > protection. A concurrent deletion can then unpublish and free that radio
> > while a frame, TX-status, or PMSR command is still using the pointer.
> >
> > I reworked the fix around a per-radio reference count.
>
> I'm not convinced that's necessary.
>
> There are three users of get_hwsim_data_ref_from_addr:
>
> hwsim_tx_info_frame_received_nl() just doesn't do anything that sleeps,
> so it could just use RCU protection directly?
>
> hwsim_cloned_frame_received_nl() uses it twice - the inner use is not an
> issue as above, and the outer one is just acquiring the mutex for
> synchronization with ->started, but given that mac80211 will sync RCU in
> stop that's perhaps just not needed at all? Or maybe hwsim just needs to
> synchronize_net() on stop.
>
> hwsim_pmsr_report_nl() uses the mutex for pmsr_request access/swap and
> GFP_KERNEL, but both of those could change? might need some more work
> for abort though, not sure.
>
> Dunno if that's better overall? Maybe, maybe not.
>
> johannes
