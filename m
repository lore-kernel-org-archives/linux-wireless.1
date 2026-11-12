Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476309;
	b=A8y+iaNNcIaMuxGHXR59oWnkHDGAj/BnJZofEdCNl4fTaAXeYSRGoU9I1oPXjAJliG9z
	 qJOWHQyNKKfbm9CKFSlSqRPrmSwN7uiB3cJo45l+zZNhfZrrFQptu+F8K7WNydMbVdSnw
	 n2gqi7NYw4cokf2Inl6c0K4ISe4fxmg93lKsaIYpQO4FcVDV/In/XxZMtZYD43QjPfw2J
	 fpj+NzkWSpznZVRAqY4teHG+qKEqKwpuvHSk7Rkzc4ijLNRWABe5hyPLGYP0dMyBFQgZQ
	 GK9hKSjkHuhMaJS8fKb/FjDLHOU1cafK2CrkDAd8tYS+LHoVIONZ0Spni9CWtQMEW9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476309;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=U2TDbKAnFz/PUpn8r3Gfv9DpcDc8O6+4aawWDP9AXUE=;
	b=ZFjOAkq3655Dck5xIbvEUUZMPP3kbsoB7+3MKKvdaBcco9JYX6G5U4koNKa8rRSbw8E+
	 ao0o6llPDO1xch36YQJXdrLpVF/Wd3U0J26pUCjw3Kzr4Tiq3iaP+FZALu3Y3llG61D55
	 J/GLP2Z/r0AWXynNpyR/EWuh1H3rkw1wUDbeShsDetssxtvb2grvqSl7REatdmCYrQtIY
	 Y40QTZBlfa4BIIH9AYkUs9lGpEpqk0QDfl1MXpCvgZCu6BZVXnuCXBIldnGJiGyxg7grt
	 MB6QhXzDDElis2dp5LgRET51VouZgks5dNLkccVNuPb8bsR+Zuq+LbMc4fwqjA2DXPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PgSIoqhe;
	arc=none smtp.remote-ip=95.215.58.132
Received: from mta1.migadu.com (out-132.mta1.migadu.com [95.215.58.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AC6606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 09:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0AC6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PgSIoqhe
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Bt1xUj/VmyXvca7gxum1cF/z09pb5LjCLbZsA6IbGVw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794476307; v=1; x=1795081107;
 b=PgSIoqhe2Ly6GkaoGdIa4ifVpEXj1dtW4gsnWYN99EyBn9m/dpugt7RZTIYumJGH1RGYP8Aw
 D075tWfV1o/7IVJJeF8gOsKqAhUP05zBsNnHWszm9+4eKvT5myY9kAWStWwID7bIw6PvOUSfgnx
 26u9WN1KU0muJ7Gak5oklx5g=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 01d0cf1fa9ea3b88;
	Thu, 12 Nov 2026 09:38:26 +0000
X-Mizu-Trace-ID: 01d0cf1fa9ea3b88
X-Migadu-Flow: FLOW_OUT
Date: Thu, 12 Nov 2026 10:38:21 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-wireless@vger.kernel.org,
 Noah Weinberger <NoahWeinberger2003@proton.me>,
 "pkshih@realtek.com" <pkshih@realtek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "security@kernel.org" <security@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_wifi=3A_rtw88=3A_sdio=3A_check_p?=
 =?US-ASCII?Q?acket_length_against_remaining_RX_data?=
In-Reply-To: <912f7250-d1bb-43cd-8efc-9ad7b0c4f1a9@kernel.org>
References: <tKht3w_knueblApO8rdPrR1QcEs6-nv-6y_7lYwYWCYqQJJ2ZiPAgcGJZuiQVeotGyIaO3EZ9j_0jFwlc5ESOzzhNSRjQu5vvUGR1kf2MUE=@proton.me> <43A4B4D6-EB5F-4079-8BE9-A452DA8B2AB6@linux.dev> <912f7250-d1bb-43cd-8efc-9ad7b0c4f1a9@kernel.org>
Message-ID: <9EEA5565-0A03-41F8-91ED-C50D4A632AE3@linux.dev>
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

On November 12, 2026 10:24:53 AM GMT+01:00, Krzysztof Kozlowski
<krzk@kernel.org> wrote:
>On 10/11/2026 02:34, Luka Gejak wrote:
>> Hi Noah,
>> 
>> Thanks for looking into this. A few comments below.
>> 
>> On November 8, 2026 11:27:09 PM GMT+01:00, Noah Weinberger
>> <NoahWeinberger2003@proton.me> wrote:
>> 
>>> Subject: [PATCH] wifi: rtw88: sdio: check packet length against
>remaining RX data
>> 
>> This doesn't apply to rtw-next, which is the tree rtw88 patches should
>be
>
>This was a report, not a patch whihc can be applied. It's visible by
>lack of DCO.
>
>
>
>Best regards,
>Krzysztof
>

As Noah wrote in private email, emphasis on submission and version of the
patch:

>Hi Luka,

>Thanks for the detailed review >and for pointing me to the >existing fix
>in
>rtw-next. I’ll drop this >version of the patch.

>I appreciate the corrections >and the guidance on the target >tree,
>testing
>and submission format. I’ll >keep those in mind for future >patches.

>Thanks,
>Noah

Best regards,
Luka Gejak
