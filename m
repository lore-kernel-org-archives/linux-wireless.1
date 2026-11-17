Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915921;
	b=qriuqNp20odBMLDRORr0e40FH06cVqztp5yxYP32nxTYIzvoQTgv7KVfGYUf8zF2/Tsk
	 Djs89uXdEtx5BZ8lpxE+9dge8Q0BJXDy8zTQC/Cf9R9Hds6eEDErnRikjNyAD4+zq8+57
	 s4Dve2mox0x2k1jo4pp7CadxW9gly/OvU5qjHU1dmV/bUiuatib54S81kMSouZXmaocU2
	 zwUch5A75SrkQS3EW3cSpK30RA5FpY2TIcloAe4/8TdINsDyKJjRmN91E6JSbwHG66x3L
	 MdDK1QoKBNTek5JCvy1E0ctSz6gh09hM1Bnvk1MtZT4HOXoEnnYIDe0yFs4D/FKMxog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915921;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=tTMQSlOhhSzWei5GvZJj+KtYI7fOB8xi6D0ubix8TQk=;
	b=Ow/1HjsoX/H7u2B888o1ejdG6XTzD45UyEVtAcTwQejUbpkori4G/ovbrzuUQuCCvSH+
	 PHZV6CQueftBL+/sPo1zco41lp6BVGKW0fOX+08buRBLLFLvRuPIrjqBAbg/MPpD/1TRu
	 8gaJbLlKuoWtxxw/iTHLtgqTLiuXPW9xkM+5bJvdj9CFNuIEJZwz6L9mFbytQkmackvOk
	 K9F1XmcXjxvUnOG7rO2+eEyW/9hw8Nxgu8C3px2GAkFcQDS1CtIixfWls+i7T5D5O9UQG
	 /zyAIYvxEYqaUTdLxT0uJT5acjPsDn9Fw3pK6f8NvrDj8sJz9w4P8Ymx4/ZzB0eFhcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JaQ0TJlW;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87137606A329
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 11:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87137606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JaQ0TJlW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794915921; x=1826451921;
  h=date:from:to:cc:subject:message-id;
  bh=tfm1rlS7aXxcTpW9u1FWmmTK4lBv40hlbZszEnHvxqQ=;
  b=JaQ0TJlWInCn9u70b14ZRqD/beBzDvl5WuF7ODVQJtzddsk46H63aoIi
   +pAGvZVBhBVUbX/ZxXncNcHASLnIUFoAaKkASY/E4bmdT2NfuTe4e8DqF
   UptPgwNz5cLvgyLSqcwVf7uTXKD3GBSnsyXjOp9+0HyC6D7jBFcd+69Zn
   n4UIa4epfsBGlgl7M0b3xAZE6nDP1i8VrEhCsvWuNUpsdRKP3OJuDc8Iu
   p62uwSMLUqK23Ogi7Ae0KnPnw5bfMRMzbwM1A50LzslV007Ze3ktVaXNf
   3QpPy35T/1N9rj/2ToXCSMtb0OW9tKsYvFLTdu3udmc89Y7BeqiY5Xigl
   Q==;
X-CSE-ConnectionGUID: X5UJaoCFT8i48p24U7bkfw==
X-CSE-MsgGUID: 4HGbhHNnRfK1sMhF98Pwcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3720493"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3720493"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 03:45:19 -0800
X-CSE-ConnectionGUID: m7ixsiG7RviRUSOS2u/Q+g==
X-CSE-MsgGUID: 1x7ELDk0RX+D8haBXORIXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10047480"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Nov 2026 03:45:17 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTHch-00000001BLx-14q7;
	Tue, 17 Nov 2026 11:45:15 +0000
Date: Tue, 17 Nov 2026 19:44:27 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: linux-wireless@vger.kernel.org
Subject: [wireless:for-next] BUILD SUCCESS
 763b13f622e2758726e8e3ecaef819db8fa0430a
Message-ID: <20261117194427.Nwl7Eysi-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git for-next
branch HEAD: 763b13f622e2758726e8e3ecaef819db8fa0430a  wifi: ath9k: uninline ar9003_paprd_create_curve() helpers

elapsed time: 1249m

configs tested: 229
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    clang-24
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                          haps_hs_defconfig    gcc-16.2.0
arc                      nsimosci_hs_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261117    gcc-13.5.0
arc                   randconfig-1001-20261117    gcc-13.5.0
arc                            tb10x_defconfig    clang-24
arm                               alldefconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          axm55xx_defconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                       footbridge_defconfig    gcc-16.2.0
arm                       jornada720_defconfig    clang-24
arm                         neponset_defconfig    gcc-16.2.0
arm                          nhk8815_defconfig    clang-24
arm                          orion5x_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261117    gcc-13.5.0
arm                   randconfig-1001-20261117    gcc-13.5.0
arm                   randconfig-1002-20261117    gcc-13.5.0
arm                   randconfig-1003-20261117    gcc-13.5.0
arm                            spitz_defconfig    clang-24
arm                         vexpress_defconfig    gcc-16.2.0
arm64                             alldefconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261117    gcc-16.2.0
arm64                 randconfig-1001-20261117    gcc-16.2.0
arm64                 randconfig-1002-20261117    gcc-16.2.0
arm64                 randconfig-1003-20261117    gcc-16.2.0
csky                              alldefconfig    clang-24
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261117    gcc-16.2.0
csky                  randconfig-1001-20261117    gcc-16.2.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261117    clang-17
hexagon               randconfig-1001-20261117    clang-17
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261117    clang-22
i386        buildonly-randconfig-1001-20261117    clang-22
i386        buildonly-randconfig-1002-20261117    clang-22
i386        buildonly-randconfig-1003-20261117    clang-22
i386        buildonly-randconfig-1004-20261117    clang-22
i386        buildonly-randconfig-1005-20261117    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261117    gcc-14
i386                  randconfig-1001-20261117    gcc-14
i386                  randconfig-1002-20261117    gcc-14
i386                  randconfig-1003-20261117    gcc-14
i386                  randconfig-1004-20261117    gcc-14
i386                  randconfig-1005-20261117    gcc-14
i386                  randconfig-1006-20261117    gcc-14
i386                  randconfig-1007-20261117    clang-22
i386                  randconfig-1008-20261117    clang-22
i386                  randconfig-1009-20261117    clang-22
i386                  randconfig-1010-20261117    clang-22
i386                  randconfig-1011-20261117    clang-22
i386                  randconfig-1012-20261117    clang-22
i386                  randconfig-1013-20261117    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson32_defconfig    clang-24
loongarch             randconfig-1000-20261117    clang-17
loongarch             randconfig-1001-20261117    clang-17
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                           amiga_defconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                        m5235evb_defconfig    gcc-16.2.0
m68k                             q40_defconfig    clang-24
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                          bigsur_defconfig    gcc-16.2.0
mips                      cu1830-neo_defconfig    gcc-16.2.0
mips                           eyeq6_defconfig    clang-24
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                      loongson2k_defconfig    gcc-16.2.0
mips                       maltaaprp_defconfig    clang-24
mips                       pic32mzda_defconfig    gcc-16.2.0
mips                          rt305x_defconfig    clang-24
mips                            xway_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261117    clang-17
nios2                 randconfig-1001-20261117    clang-17
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                 generic-64bit_defconfig    clang-24
parisc                randconfig-1000-20261117    gcc-9.5.0
parisc                randconfig-1001-20261117    gcc-9.5.0
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                      asp8347_defconfig    clang-24
powerpc                       bamboo_defconfig    clang-24
powerpc                  canyonlands_defconfig    clang-24
powerpc                       cm5200_defconfig    clang-24
powerpc                       ep88xc_defconfig    clang-24
powerpc                        holly_defconfig    clang-24
powerpc                  mpc8313_rdb_defconfig    gcc-16.2.0
powerpc                mpc834x_itxgp_defconfig    clang-24
powerpc                  mpc836x_rdk_defconfig    clang-24
powerpc                      mpc83xx_defconfig    gcc-16.2.0
powerpc                       pasemi_defconfig    gcc-16.2.0
powerpc                       pcm030_defconfig    clang-24
powerpc                       pmac32_defconfig    clang-24
powerpc                      powernv_defconfig    gcc-16.2.0
powerpc                        ppc64_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261117    gcc-9.5.0
powerpc               randconfig-1001-20261117    gcc-9.5.0
powerpc                      skiroot_defconfig    clang-24
powerpc                          wii_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261117    gcc-9.5.0
powerpc64             randconfig-1001-20261117    gcc-9.5.0
riscv                             alldefconfig    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261117    clang-24
riscv                 randconfig-1001-20261117    clang-24
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261117    clang-24
s390                  randconfig-1001-20261117    clang-24
s390                        zfcpdump_defconfig    gcc-16.2.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                              espt_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261117    clang-24
sh                    randconfig-1001-20261117    clang-24
sh                           sdk7780_defconfig    gcc-16.2.0
sh                            se7750_defconfig    clang-24
sh                            sh2007_defconfig    clang-24
sh                      sh7710voipgw_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261117    gcc-15.3.0
sparc                 randconfig-1001-20261117    gcc-15.3.0
sparc                        sparc32_defconfig    gcc-16.2.0
sparc                        sparc64_defconfig    clang-24
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261117    gcc-15.3.0
sparc64               randconfig-1001-20261117    gcc-15.3.0
um                                alldefconfig    clang-24
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    clang-24
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261117    gcc-15.3.0
um                    randconfig-1001-20261117    gcc-15.3.0
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261117    gcc-13
x86_64      buildonly-randconfig-1001-20261117    gcc-13
x86_64      buildonly-randconfig-1002-20261117    gcc-13
x86_64      buildonly-randconfig-1003-20261117    gcc-13
x86_64      buildonly-randconfig-1004-20261117    gcc-13
x86_64      buildonly-randconfig-1005-20261117    gcc-13
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261117    clang-22
x86_64                randconfig-1001-20261117    clang-22
x86_64                randconfig-1002-20261117    clang-22
x86_64                randconfig-1003-20261117    clang-22
x86_64                randconfig-1004-20261117    clang-22
x86_64                randconfig-1005-20261117    clang-22
x86_64                randconfig-1006-20261117    gcc-14
x86_64                randconfig-1007-20261117    gcc-14
x86_64                randconfig-1008-20261117    gcc-14
x86_64                randconfig-1009-20261117    gcc-14
x86_64                randconfig-1010-20261117    gcc-14
x86_64                randconfig-1011-20261117    gcc-14
x86_64                randconfig-1012-20261117    gcc-14
x86_64                randconfig-1013-20261117    gcc-14
x86_64                randconfig-1014-20261117    gcc-14
x86_64                randconfig-1015-20261117    gcc-14
x86_64                randconfig-1016-20261117    gcc-14
x86_64                randconfig-1017-20261117    gcc-14
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                           iss_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261117    gcc-15.3.0
xtensa                randconfig-1001-20261117    gcc-15.3.0
xtensa                          virt_defconfig    gcc-16.2.0
xtensa                     xip_kc705_defconfig    gcc-16.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
