Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280355;
	b=rXzQftovKrqmjMSNgbo+ZPhEDhRUpKHG1R/shN7cPMwlbh9ngsjMlPiEy7vg6td4CPWP
	 WsvZVl3IEh3FXduwGBYU8dOMgIaTpkNCrAI1dRFgglgp9SUjOOUcFwmU+ammuDqAeMdk3
	 DxMX57Dco0Lt98qjI5in5HZKCnrmgo3sNyU3omN5V5aPIyl/sQi30h1hCAwT1IQp1z3up
	 /up7rjU2jFzZFXPa+yShTYDxHxS/juEJHwMZPaEPGQD4K/+UaZ6DbFNyctceIKE0cpMTK
	 7Esll5Br2qQjkIHuqhWn2bs2nelKHmVG3At+sK+fF8F9Kx4lK+aC6UmMPv5NVVlSNWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=rDM6x7XRc95I3mGTLkYrN/qxWaVNHBCaXNGEhzTwFik=;
	b=EGicCxUvaKatX3ZzybKvzVGxu2WZOGz5ETyBR7i5LZ1HIQ9MHnXyPpU6M3k9ctuHARZH
	 uKl9rNTQge46fp9nioG+eS3MYPXv6CVxVrl7gszsmS2qO6fbhlSx5a3WtTWsd/d7WoAN/
	 hh3OodKKcN7AK3lBVbD4JXkU4eEZ4BtJdKPWFQEWpd+yVqGDxLPSKmKeIfHVetZEVkpJ6
	 Oyfa6t1+UzzF9fcmFFAIg3MfJ6htxaOB8I3O2IQilmGyJidH/O3/NX5QhAETqRUZJWga4
	 m3cn/EYvBNLj/1/evXcx/F+I7oiFYdh2KcduYveEgfif+8E4DxhEJSgJOuzn6vwvOXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lERNHzN2;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F4B606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62F4B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lERNHzN2
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a2761c69fbso2062340c88.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 19:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1794280354; x=1794885154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rDM6x7XRc95I3mGTLkYrN/qxWaVNHBCaXNGEhzTwFik=;
        b=lERNHzN2PlgoxjFpOUSZJXNvgYUi4F2qPOEedr0c+7BiYngb2iJtOTDek4zcSphV/D
         cloVn2wAArz/dBqWxk9NZjUfHb6G0JCgoJlYXEjw4IMVB+DQ57iVQfpb6/5PFt62lhmd
         BuQk9/32ra6sR5DltWGPR1lAHkp7poFKw0TJ8D+TW/LODlALwnUysZ5K00J96CNcuqop
         Hg+taw2BpXxzta5/bbfrgeQOJAxdbMo0x+QechfevCTARpqTG/ssU6q04FmXYjGU0AqV
         ciVkRQAtUUcffXNCiRTcqV2NXmgN95qdrQCaJ332UkmF3Elq3nd5+Tf/wOjgr2JCA39X
         wWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280354; x=1794885154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rDM6x7XRc95I3mGTLkYrN/qxWaVNHBCaXNGEhzTwFik=;
        b=Uo3ekE7kU6VHsEob0NU418yA4mzjiOwde8fxPrEGcbeWTozDSfRGI5fA3ifSHNA/N6
         mbwu2jq0cqKR9VtpMC6Y//G2CSTE5VSBnc2/5ILVTrqRjjsLr6Vy4HcXzkUCzbK9lw6F
         r0be9/MO2ac0mVDv3qLF0MqIBXT4lsDeEngaS+l0Q+7VV7Uo1AMRbBM0COEznFIBfQB8
         N2SVSetWmO6mCkpZsS3GMXxAwzExjHEfLJhWYXdmWhxLtMFYS71ou4nBC6alw4xGZxWc
         l6+ZZ5lp/lZHBZbyP//VMT6xwrzodslEld8rcJ4JVZkRA24g2VnqhNt3jKlxJqIfyBF/
         Ubiw==
X-Gm-Message-State: APuU4Z/m+SUI4oyk9DiqfCDmJnQjVdK49QwrT40lhlDQewHZPNB0x/9K
	4nmbMuDZmARoGudsU29qAm2ouDU7n7ATZ1K2Nlhc0Aw/NgfNGCPvKDRfV1HX8r7zk3Nv8OkokH6
	eqSSQ/ZM=
X-Gm-Gg: AYBFou0Zzbml25dUIgeCj5SRymvQLkDP7Ng8Z+PzZN5kaD+yXlUD94tj44Sc1RsGylA
	nu8FfGQW+FPTJpvASuI7esET59SSobl2fyBXy1sYAuMQaaVVOfBPMEoB0EU2uxM/ZB9JQzPpG2F
	jnAwMQmENpZlDIAXW8DyqQhlG5++EVbJDTbJZiv5JW+s4OlDjb1p96pgeyRQWkgcXLWFLeyiYr6
	yDHLMDynk36s5/N8qY5osTSA5V0nqUxPVbpd2pHJd7YJjkQ+QS99BVMWZ4HpWB9dXxKfwOJgRtJ
	WhHtKu30WvQR+nB/fk8f3jFZfasGJSy6L1DT1zMrMEnkaZJZDgUjJLDvZx+bx76qWaKoKNevlg3
	9wzKDyqF6QWi47vJ09Y/3lEnY6CTJz46h18bsAff+FNVowk9+oU8tl9PSiW4xpvKod7e5FOp3ON
	KG/VXKtQpHGloMvT5GAOGdf8u6M2IYsPW9i/r6ua9SFRButX83Nq0apX0gJxVZ4cEG58wBFwEsJ
	4QZIPOm8WdPv37laC+g1XcNh15S9WD79QBqFudPDgu7Vfjw8qXWfT6Ffnz/4YAnC5edd0Z8Uafq
	laJBTXxksoHRliLztgi3YzKUb/fRmFOxcVYJtPrHk3PG0IldPMA+57Pmm2ZgjRYLUSuQ
X-Received: by 2002:a05:7022:3709:b0:187:7514:47f4 with SMTP id a92af1059eb24-1b3b6198c74mr1928005c88.46.1794280354211;
        Mon, 09 Nov 2026 19:12:34 -0800 (PST)
Received: from localhost ([60.227.235.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b56c4e88sm2970998c88.0.2026.11.09.19.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:12:33 -0800 (PST)
Date: Tue, 10 Nov 2026 14:12:31 +1100
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, 
	Johannes Berg <johannes.berg@intel.com>
Subject: Re: [PATCH wireless-next 7/7] wifi: mac80211: destroy AP stations
 asynchronously
Message-ID: <mqlyphap56ct4ffa7v4ebpvvw4fuof2mezmx337zbtspozxhiw@deo6hs6xu3us>
References: <20261102235603.1181883-9-johannes@sipsolutions.net>
 <20261102235603.1181883-16-johannes@sipsolutions.net>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102235603.1181883-16-johannes@sipsolutions.net>

On Tue, Nov 03, 2026 at 12:54:04AM +0100, Johannes Berg wrote:
> From: Johannes Berg <johannes.berg@intel.com>
> 
> When hostapd removes a station, the station destruction
> needs to wait for an RCU grace period, all while holding
> the wiphy mutex and blocking hostapd.
> 
> For AP stations, use a wiphy_rcu_work to finish the
> cleanup after an RCU grace period, without holding the
> wiphy mutex while waiting.
> 
> To avoid confusion in drivers, destroy stations that are
> waiting for destruction synchronously before adding new
> (link) stations, as well as suspend/restart.
> 
> Assisted-by: LLM
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>

Reviewed-by: Lachlan Hodges <lachlan.hodges@morsemicro.com>
