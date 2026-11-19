Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088198;
	b=2Aof/eeKZAK+2pWQ6zTL5Xsa8a9o7Csd9HiaEocr2TAPG+YKNB4YxdGIuXTSB+Ptrhx4
	 enRCfS0aCaAZBnZ575euIDORK3fdfeQsvZ8Uif2hDms0c2I9LsnuTX6/G1k2oRSSf/k28
	 iGewyxWAs2RgfhXFOd32gL/d7Ukam00kE5eIhxENkOWHcdXB9WJPoc8/lUVOqWVvyC5Fn
	 VJTxiMnxdF4PRvPekEFI5Cm8XmaJUWwu+3fghxoAjZALpCCer3uODyRB0Qu+28VhPLOxg
	 nlUa/0SZc7X+GvlIXZVfcwMxrupyFKrX6YZfH4e4VFrxT2esjtpplB6B1PFOZaJ5syg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=oIcwM1wCOuufmr0whOfMJ6KMEYvZEq7IEw12+GOzHfk=;
	b=malD4nGexB6xJEsDzHU0S9F+YwTZBYIstAGKGBDEnYll3FWgdXHJ+rQS3KCeM2MtWZD4
	 TFpPBk+D55XNuW+gDfb25dx1mYIl43M9vNjobcq6249rhO6/K17xPRgLX8C6k50knZd/S
	 SS+YsMijRh9YXbCDTCxSCUXcEFuTitn3doQM62NbcLIjvy3tg9NOW+9iCVIDNqEfvlTM8
	 p6Az08pdqFR/okVSkg0QSyLOPnDf6p/dNh4Z3bS4NrlmJ3LzX0q4tXm83oGr35FZILkVu
	 sbr3zJJQnm+p3i49UNUK9Uh55jW6Ex9+1VhVyg24V7ZuegSkweoIUhCkisgaQectxfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FYnySu+d;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AD0606A325
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 11:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94AD0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FYnySu+d
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso29675575e9.0
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 03:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795088196; x=1795692996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oIcwM1wCOuufmr0whOfMJ6KMEYvZEq7IEw12+GOzHfk=;
        b=FYnySu+dpa9XTmDw1nlOpAHP5ghF1X3RvqstJNiDc2d9femsn3Z1eHDvQaQHwJAOSc
         sWZYhfBF8c3kRC8T6QtjI2EQ9d+tD4wq1bM+IfVrXzrbBVZwW8NLauKK/DG/jg8bJq9w
         dl2ZAfIC3Ud4fRHB6bBvdIi3QA+cF50Nq28FmIsSkt7dMFDUAfZ0eXNhkF5/5W1NOz49
         TfZjP/1TT56KhoeDGeusHcPZzkWKGFOwijcsBbTuTcS/76yDDV2MZhJ4j6ddsjJHNZCt
         ysIWmVonZM1Ydy+143v4KYSmWARziObbejszw1YngIjT7l3Y+hu48Nl9+rF55/AEI6N4
         KNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088196; x=1795692996;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oIcwM1wCOuufmr0whOfMJ6KMEYvZEq7IEw12+GOzHfk=;
        b=xyXMG/2HgMJfVmguFxtKMcctXtxmlJpU+Wg2ycZJbN1uhiPQgmlgLwn3VLdEgneBZk
         1Xuso0OF02Ab1TT0YOY+YhFcZCX7qU94jql8QMCXZBRyINi9QE63EzhspFXblQQ67/hX
         uihJlZJLERooqrFwSe2m+VdZANS0F9VX+mrqokEUkrb2GMHasU04PpffvJfHX6OaaX5g
         aJTNt13vVCOga7A6cqm6QXxOrrpkhW1wx/nfqpz9J4kovYgk3a4AzqGlvob0rKHOk2cb
         lbKf2oo7feH+0jREL9txphN3p9s4vqBeDfcQy33u5fy7UwXVT45cROSy45I71WgYPMLj
         hb7g==
X-Gm-Message-State: APuU4Z+b2cK7QfXWfPMJX1HSPFE0hPEU/aQIhD5oIb5dGr2/Z6/3zd/P
	iKxtIQqJ07IAWKkKzf0k9bzk+cVfnLA6/blkOBlIRxim/j7lwbGaOSRwplbWeg==
X-Gm-Gg: AYBFou0qS0ZzCOItaOg2XQs7EnTUhGfTMYmOTxWGsDJaj1et4AZDrnZLAwmRvdDmTvv
	a6CbgIg5YjU1hBO+hMSPP5mVfMnd/SmSjATy8HuddTecw3eRsuCf03lhfa+TKG4Ic4A3U3XcBqh
	Qg0fiTg3zI2qas8W9yIcPjoe2G0UuQT7BKsUU4EY31TZO1EqsOVALkN/y6svYEutnNqp3S/lEcH
	SuvLFsleMjTaBgqlHeaeqky1LShQ5U5LMI+ZviKEb7Em3kaW0zTaZy4mKnXwFiqQw6njjWdZluo
	eB/Je+FcZik8BJHzzdRgUsEMdBJ/WS3yVYtQK6WMvQUnG9V7ZPb8OTEQoDyid2zWpqc2pSRjPxP
	UKDtg5pWZ5+Zg5xKdb+HsvYKHri1x/snLmXKbsh4Gb6VfAhzavzTL79kKwZP7sbwfm/lVsuNgoE
	NgUEd7x4ytQgvxJMLBqm/GNSoO7NVA1jg3yJMMddGqcoZdBwJ9eUhve/JJ5oUyRJeYWwKtF2Y/v
	5rYSwdwM1VM5Ye6qcS3rNFsy17YDH7vUuI3bSv4YkePtg5Z3Yu2aPpIUvV7vOKaQtruNbD6qBm/
	6OMRq2puUvhlc5VrOAIkwX1MtmAoQzcxvHfuisn7wxBM6+6Wx5e/FrUHz8hRxq+cjoJTDjS9sQO
	bTnITNMJ/6n88iXA8T2vcItPTNh3Jw9Zj
X-Received: by 2002:a05:600c:c16d:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4bb7da3af11mr112687085e9.16.1795088195540;
        Thu, 19 Nov 2026 03:36:35 -0800 (PST)
Received: from shift.daheim (p200300d5ff07190050f496fffe46beef.dip0.t-ipconnect.de. [2003:d5:ff07:1900:50f4:96ff:fe46:beef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c11f4bsm10290568f8f.51.2026.11.19.03.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:36:35 -0800 (PST)
Received: from localhost ([127.0.0.1])
	by shift.daheim with esmtp (Exim 4.100.1)
	(envelope-from <chunkeey@gmail.com>)
	id 1xU0R2-00000000QZW-0hhB;
	Thu, 19 Nov 2026 12:36:33 +0100
Message-ID: <2b4f5359-096b-4add-b2d5-6b2d5705081c@gmail.com>
Date: Thu, 19 Nov 2026 12:36:33 +0100
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: carl9170: take the URB reference before queueing
 the TX frame
To: Alexandre Becholey <alex@becholey.ch>
Cc: linux-wireless@vger.kernel.org
References: <20261119093511.558151-1-alex@becholey.ch>
Content-Language: de-DE, en-US
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <20261119093511.558151-1-alex@becholey.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 10:35 AM, Alexandre Becholey wrote:
> carl9170_tx() puts a frame on ar->tx_status[] while it holds only its
> initial reference and takes the reference for the URB afterwards. A TX
> status for the frame's cookie that is processed on another CPU in
> between drops the only reference, and mac80211 frees the frame. The
> driver then increments the dead refcount and submits the freed skb as
> URB buffer and context.

Ok, so you have virtual AR9170 (as in USB-emulated device or did you
make a custom firmware) that is injecting/generating tx_statuses with
potential "future" cookies to arrive even before the driver gets to
fully assign the cookie?

Yeah, I think I can see what you are doing there and why.

> A device can hit this window by reporting TX status for the small,
> predictable cookies while the host transmits, which gives a KASAN
> slab-use-after-free in carl9170_usb_tx() and carl9170_tx_callback().
> 
> Take the reference before the frame is queued, as the driver did
> before commit caf1eae20668 ("carl9170: improve unicast PS buffering").
> 
> The bug was found, and the reproducer and this fix were written, by AI
> agents (Claude Mythos and Claude Opus models). The analysis and the
> patch were reviewed by a human.
> 
> Fixes: caf1eae20668 ("carl9170: improve unicast PS buffering")
> Cc: stable@vger.kernel.org
Acked-by: Christian Lamparter <chunkeey@gmail.com>

> Signed-off-by: Alexandre Becholey <alex@becholey.ch>
> ---
> An emulated AR9170 that answers TX status for cookies 1..4 while the

Do you really have emulated AR9170 like something similar to mac80211_hwsim? Cool!
I'm not interested in the reproducer, but a even a semi-working simulator for the
AR9170: Now that would be sick!

> host sends traffic (an unprivileged UDP socket is enough) triggers
> "refcount_t: addition on 0" and KASAN use-after-free on v7.3.1 and
> "kernel BUG at lib/refcount.c:34" on master 666539eecdf4. With the fix:
> no report in 68 patched trigger boots (9 on xHCI, 9 on master); traffic
> with a well-behaved device (also HT/A-MPDU) is unchanged.

Am I reading this correctly? You have access to a real AR9170 hardware device too
and this patch was tested there as well? If that's the case, why did you not add
this to the commit message above? Because I think this belongs into the commit
message. This is the "best" way to show everyone that you really did
"dotted the i's and crossed the t's".

Question: What do you mean with (9 on xHCI, 9 on master)?

Do you mean 9 tests where successfully performed on real hardware (connected to a xHCI controller)
And "9 on master" means that a patched linux on top of 666539eecdf4 [1] survived without
triggering a use-after-free?

Cheers,
Christian

[1] <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=666539eecdf4db623f5e3c3e55cf9f2dfad24aa4>


> Reproducer available on request.
> Applies to master 4405c18c95d2 (tx.c unchanged since the tests).
>   drivers/net/wireless/ath/carl9170/tx.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
> 
> 
> diff --git a/drivers/net/wireless/ath/carl9170/tx.c b/drivers/net/wireless/ath/carl9170/tx.c
> index 06aaf281655b..46d8bc6647e3 100644
> --- a/drivers/net/wireless/ath/carl9170/tx.c
> +++ b/drivers/net/wireless/ath/carl9170/tx.c
> @@ -1364,13 +1364,6 @@ static void carl9170_tx(struct ar9170 *ar)
>   
>   			atomic_inc(&ar->tx_total_pending);
>   
> -			q = __carl9170_get_queue(ar, i);
> -			/*
> -			 * NB: tx_status[i] vs. tx_status[q],
> -			 * TODO: Move into pick_skb or alloc_dev_space.
> -			 */
> -			skb_queue_tail(&ar->tx_status[q], skb);
> -
>   			/*
>   			 * increase ref count to "2".
>   			 * Ref counting is the easiest way to solve the
> @@ -1378,9 +1371,18 @@ static void carl9170_tx(struct ar9170 *ar)
>   			 *	carl9170_tx_callback
>   			 * and wlan tx status functions:
>   			 *	carl9170_tx_status/janitor.
> +			 * It must be taken before the frame is queued on
> +			 * tx_status[], where the status path can find it.
>   			 */
>   			carl9170_tx_get_skb(skb);
>   
> +			q = __carl9170_get_queue(ar, i);
> +			/*
> +			 * NB: tx_status[i] vs. tx_status[q],
> +			 * TODO: Move into pick_skb or alloc_dev_space.
> +			 */
> +			skb_queue_tail(&ar->tx_status[q], skb);
> +
>   			carl9170_usb_tx(ar, skb);
>   			schedule_garbagecollector = true;
>   		}

