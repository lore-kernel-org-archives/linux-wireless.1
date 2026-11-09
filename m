Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794252267;
	b=lQ3Gd6p7uxzQ3MPkHMYFd2vyYpFPQQKM2WDdatrveaACKOmrl0V398qcIgNdfbsGC8+v
	 yrTqhJTvuQcKQaB5oZt6lId5hoRWGJHQbu55Z23q8NJhear3ERB2myV0R7J1cRDygeSu7
	 GWNma4Lcyl70hh7ztZ59GJlKsfMkTZDJeHxK6AUjBFwvjAfnHU4oAkoKHQ4R9zikEcChx
	 0WaZN2NAZYta43OpqPSQVaB4edingxUC4U/zE1ArdsdLTsMWbrBXKd3yMThhj6YytWCH6
	 JBu6tcO8ueYinJeAy0nHx0GiRsbjMKHue6TfzXVFTHBhdx06oZ4U5uIy9V/9sRQVnkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794252267;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kAQUq725Dey8s8eeGqNtRcBcUkrdKQx6AnFS5bZmLVs=;
	b=xXS7+dAMI0B+sp2ULxptGQb0f9s/ZkHr9yqOcrOhTDL8/W9vaNTBmz5GcUAAPZLo1xxG
	 fC7Uyd136zvtkVt8fS/vFrsJUoWKbCEKFb0H9V8L1lDqKVpLwF8/JZzZQsHA4namenUtT
	 c26QepN8BEYK4u75/V1eB9zsBdIC/1Lqds0JfSKgAj+2DEfiU1rQC6HM2RsS8KfC/5FNo
	 itVP9QscVrMGNiY5rvBJGUOiUk+VY7fL+vzP/tRJCYKnS+6V+Q2vsIMZUSrb0scceDHey
	 SkcBMPXzcvwJWwD8UgOpoL5oj+rWmBiDv8DKArkBsLM54k7V4+kXM3Hdrz5BZpN0TVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BBKlkNzZ;
	arc=none smtp.remote-ip=95.215.58.113
Received: from mta1.migadu.com (out-113.mta1.migadu.com [95.215.58.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A99606A325
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 19:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52A99606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BBKlkNzZ
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kAQUq725Dey8s8eeGqNtRcBcUkrdKQx6AnFS5bZmLVs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794252264; v=1; x=1794857064;
 b=BBKlkNzZrUYZE9xbveHatbXjBCZQzV7qyWZBYCijougK7tWMgUahhFR5JlHh3LsqMcUs0m8L
 IHFa10K8MCXWRqn8kJpo0W6PzDo08anjz0MBCWrEtBokoxrHQ5nFD2wh7mvV6aoloc61rDNjcf7
 OLTknsOgYA1ukFrEJhB1sH/Q=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2581b162146d1682;
	Mon, 09 Nov 2026 19:24:24 +0000
X-Mizu-Trace-ID: 2581b162146d1682
X-Migadu-Flow: FLOW_OUT
Date: Mon, 09 Nov 2026 20:24:22 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RESEND_rtw-next_v2_1/2=5D_wifi=3A_rtw88?=
 =?US-ASCII?Q?=3A_8822c=3A_fix_out-of-bounds_access_in_cck=5Fpd=5Fset?=
In-Reply-To: <20261109182001.29076-1-zeshanahmednobin@gmail.com>
References: <20261108182837.682661-1-zeshanahmednobin@gmail.com> <20261108182837.682661-2-zeshanahmednobin@gmail.com> <0FD97102-7E9C-47DA-9B52-7F7A837E2924@linux.dev> <20261109182001.29076-1-zeshanahmednobin@gmail.com>
Message-ID: <55577FA1-C8E3-4810-800A-487C2526F9C0@linux.dev>
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

Hi Zeshan,

On November 9, 2026 7:20:01 PM GMT+01:00, Zeshan Ahmed Nobin
<zeshanahmednobin@gmail.com> wrote:
>
> patch 2 is then what handles a dead chip. In v3 I'll update its
> message for that and add Cc: stable to it as well. Its code doesn't
> change; is it fine to keep your Reviewed-by on it?

Yes, that matches what I see, so please keep it.

"bw has already been checked at that point" in the message and "patch 1
returns first" in the notes won't be true any more, so those need
updating too. The forced bw test won't apply either, so maybe run the
real chip failure case again with both patches.

As far as I can see patch 1 alone would then reach that zero mask access
on PCIe, so maybe keep this order and say in the cover letter that the
two belong together.

Best regards,
Luka Gejak
