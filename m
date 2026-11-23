Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.177.160.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429608;
	b=mcoW3J9nqIhMjh9A3oLq0fiUoL7+iKi8V2COSZM5fUaGKnUFpdY0jutJMdqo3kFce+Py
	 VCQR+IAMkddVUVCP4LSZJRJz+Q+5YnikMoBuxqgznYY2whVQN947IRrvIx2stgu9wRHVo
	 SSB5/iC25b9dTuMojObOediur5Ap0Vc1HTsj+mNPHwn+HbeJeWV0Y1Zv8PHe78PIstYhw
	 skbGk1BGfanI6I+o7a2fni5Jqa7zj4AufPw3/bjgxm9jbWd2mLAUylZJ/BVYFA0ObG/wQ
	 R5ZHEXba6/N4UR2kI+GHNrnP952pgjjrGmS4i1QhFLSkLT3oCKCMMtnN80Aor/PRrkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429608;
	h=DMARC-Filter:Received:Received:Received:Received:Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-CC-Diagnostic;
	bh=okFYmTbXlQFt4zqASJvUdCO2CjwrJ0EwuE4gB7fuen0=;
	b=UVS8asq6YBL5pMkdyn0DxfAMOlFDXcJbiCBp9B/00+N4hRGZhUSNe8n4OucFHelEFd4o
	 DJh5Jqq1KD0/2+ndBnVoOxVxoE4K/8sBa8akud03WMkIV7a5mes/m2t/utvJXV4hac3JP
	 NHNL+6NblSJxG8iYqja3jdNXIM7ZlYrBWAaSPkeyq9KX+XESRSW9cUv/FaSJ1nlTXeG3j
	 IQWH2EKS7pmxSjczrELvXu7BFd4vl7FnEIIscXhlOuP6/7q6Z1C1GzJjbhJLCeAJr+GMn
	 ofnBuYw+mNC0IFNo7ELyGGZ3ng1EWgzDaGnVyD0MsdPOBSVU7tio+7Vivwe1S9E7s4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfareas.com;
	spf=pass smtp.mailfrom=rfareas.com;
	arc=none smtp.remote-ip=81.177.160.4
Received: from s24fifth.in-solve.ru (s24fifth.in-solve.ru [81.177.160.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC19606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 10:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DC19606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfareas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfareas.com
Received: from Spooler by s24fifth.in-solve.ru (Mercury/32 v4.52) ID MO000C20;
    23 Nov 2026 13:26:49 +0300
Received: from spooler by mail-aux1.in-solve.hidden (Mercury/32 v4.52); 23 Nov 2026 13:26:41 +0300
Received: from mail-s22 (10.0.1.22) by mail-s24-t.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG000C1D;
   23 Nov 2026 13:26:39 +0300
Received: from Spooler by mail-s22 (Mercury/32 v4.52) ID MO000CDC;
  23 Nov 2026 13:26:34 +0300
Received: from spooler by mail-s22.in-solve.hidden (Mercury/32 v4.52); 23 Nov 2026 13:26:31 +0300
Received: from ehlo.thunderbird.net (128.204.79.23) by mail-s22.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG000CD9;
   23 Nov 2026 13:26:30 +0300
Date: Mon, 23 Nov 2026 13:26:32 +0300
From: RFAREAS Support <support@rfareas.com>
To: wens@kernel.org, Chen-Yu Tsai <wens@kernel.org>
CC: linux-wireless@vger.kernel.org, wireless-regdb@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_wireless-regdb=3A_Update_?=
 =?US-ASCII?Q?regulatory_info_for_Kazakhstan_=28KZ=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAGb2v65sW+JADcdONnBPm0dUA+=LopxMP6Xai54xiJxxqg2Q4A@mail.gmail.com>
References: <7C3E3534-43A6-4D85-BAA7-9BC337438EEB@rfareas.com> <CAGb2v65sW+JADcdONnBPm0dUA+=LopxMP6Xai54xiJxxqg2Q4A@mail.gmail.com>
Message-ID: <3E10FCAA-2522-417E-AAE0-4D2B646BE2C6@rfareas.com>
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
Content-Transfer-Encoding: quoted-printable
X-CC-Diagnostic: Header RECEIVED matches "*([0-9]+.[0-9]+.[0-9]+.[0-9]+)*" (0)

> TPC is required for this band=2E The allocation table has a footnote sayi=
ng
> that ITU-R Resolution 229 is to be followed=2E This requires both DFS an=
d
> TPC for 5250-5350 MHz=2E
>
> Without TPC, the limit is reduced by 3 dBm, or halved=2E Hence 20 dBm he=
re
> is correct=2E

You're right, footnote 5=2E446A of the KZ allocation table refers to
Resolution 229=2E v2 keeps 20 dBm for 5250-5350 MHz and adds the channel
144 fix you asked for as patch 2/2:

  [PATCH v2 1/2] wireless-regdb: Update regulatory info for Kazakhstan (KZ=
)
  [PATCH v2 2/2] wireless-regdb: Allow channel 144 for Kazakhstan (KZ)

Thanks,
Valery


--=20
RFAREAS Support
